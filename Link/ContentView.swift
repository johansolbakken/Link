//
//  ContentView.swift
//  Link
//
//  Created by Johan Solbakken on 30/01/2022.
//

import SwiftUI
import CoreData


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc;
    @Environment(\.openURL) var openURL;
    @FetchRequest(sortDescriptors: []) var links: FetchedResults<Link>;
    
    @State private var showEditor = false;
    @State var title:String = "";
    @State var url:String = "";
    @State var currentLink:Link?;
    
    
    var body: some View {
        ZStack {
            VStack {
                // Logo
                LogoView()
                
                // List of links
                List(links) {link in
                    HStack {
                        Text(link.title ?? "Unknown")
                            .font(.title2)
                            .onTapGesture {
                                let url = URL(string: link.url ?? "");
                                openURL(url!);
                            };
                        Spacer();
                        Button {
                            title = link.title ?? "no title";
                            url = link.url ?? "no url";
                            currentLink = link;
                            showEditor = true;
                        } label: {
                            Label("Edit", systemImage: "pencil")
                        }
                        Button {
                            moc.delete(link);
                            try? moc.save();
                            showEditor = false;
                        } label: {
                            Label("Delete", systemImage: "trash");
                        }
                    }
                }
                
                if (showEditor) {
                    VStack {
                        Text("Edit")
                            .font(.title2);
                        
                        TextField("Title", text: $title);
                        TextField("Url", text: $url);
                        
                        Button {
                            currentLink?.setValue($title.wrappedValue, forKey: "title");
                            currentLink?.setValue($url.wrappedValue, forKey: "url");
                            try? moc.save();
                            showEditor = false;
                        } label: {
                            Label("Save", systemImage: "square.and.arrow.down");
                        }
                    }
                    .padding()
                    .border(.foreground);
                }
                
                Button {
                    let link = Link(context: moc);
                    link.title = String("No title");
                    link.url = String("");
                    link.id = UUID();
                    currentLink = link;
                    showEditor = true;
                } label: {
                    Label("Add", systemImage: "plus.square");
                }
            }
            .frame(width: 400)
            .padding();
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        };
    }
}

struct LogoView: View {
    var body: some View {
        HStack {
            Image(systemName: "link")
                .resizable()
                .frame(width: 30, height: 30);
            Text("Link")
                .font(.largeTitle);
        }
    }
}
