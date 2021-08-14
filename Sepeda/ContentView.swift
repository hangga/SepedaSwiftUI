//
//  ContentView.swift
//  Sepeda
//
//  Created by Hangga Aji Sayekti on 14/08/21.
//

import SwiftUI

struct ProductModel : Identifiable {
    
    var id : Int = 0
    var name : String = ""
    var photo : String = ""
    var price : Int = 0
    var city : String = ""
    var rating : Int = 0
    var totalrating : Int = 0
    
    init(id : Int, name : String, photo : String, price : Int, city : String, rating : Int,totalrating : Int) {
        self.id = id
        self.photo = photo
        self.price = price
        self.city = city
        self.rating = rating
        self.totalrating = totalrating
    }
}



struct ContentView: View {
    
    let data : [ProductModel] = [
        ProductModel(id : 1, name : "Sepeda Satu", photo : "img1", price : 200000, city : "Yogyakarta", rating : 3,totalrating : 5),
        ProductModel(id : 2, name : "Sepeda Dua", photo : "img2", price : 450000, city : "Jakarta", rating : 5,totalrating : 5),
        ProductModel(id : 3, name : "Sepeda tiga", photo : "img3", price : 245000, city : "Bali", rating : 1,totalrating : 5),
        ProductModel(id : 4, name : "Sepeda Empat", photo : "img4", price : 370000, city : "Aceh", rating : 3,totalrating : 5),
        
        ProductModel(id : 5, name : "Sepeda Lima", photo : "img5", price : 465000, city : "Surabaya", rating : 3,totalrating : 5)
    ]
    
    var body: some View {
        //Product()
    
        NavigationView{
            ScrollView{
                ForEach(data){
                    row in
                    VStack(spacing:5){
                        Product(data: row)
                    }
                    .padding()
                }
            }
            .navigationTitle("Toko Pit Kotagede")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Product : View {
    
    let data : ProductModel
    
    var body: some View{
        VStack(alignment:.leading){
            
            ZStack(alignment:.topTrailing){
                Image(self.data.photo)
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(height: 200)
                    .clipped()
                
                Button(action: {print("Ok")}){
                    Image(systemName: "heart")
                        .padding()
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                }
            }
            
            Text(self.data.name)
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding(.leading)
                .padding(.trailing)
            
            Text("Rp. \(self.data.price)")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.red)
                .bold()
                .padding(.leading)
                .padding(.trailing)
            
            HStack(){
                Image(systemName: "mappin.circle")
                Text(self.data.city)
            }
            .padding(.leading)
            .padding(.trailing)
            
            HStack(){
                HStack(){
                    
                    ForEach(0..<self.data.totalrating){
                        items in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    /*
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    */
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            
            Button(action : {print()}){
                Spacer()
                HStack{
                    Image(systemName: "cart")
                    Text("Beli Sekarang")
                        .font(.callout)
                        .padding()
                }
                Spacer()
            }
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
            
        }
        .background(Color("warnabg"))
        .cornerRadius(15)
    }

}
