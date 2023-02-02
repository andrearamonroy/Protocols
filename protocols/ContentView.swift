//
//  ContentView.swift
//  protocols
//
//  Created by Andrea Monroy on 2/1/23.
//

import SwiftUI

//protocol for structs
protocol ColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

//colorTheme for app
struct DefaultColorTheme : ColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct AlternativetColorTheme: ColorThemeProtocol {
    let primary: Color = .gray
    let secondary: Color = .white
    let tertiary: Color = .green
}




//protocols for class
protocol ButtonPressedProtocol {
    func buttonPressed()
}


protocol ButtonTextProtocol {
    var buttomText : String { get }
}

protocol ButtonDataSourceProtocol : ButtonPressedProtocol, ButtonTextProtocol {
}

//class

class DefaultDataSource: ButtonDataSourceProtocol {
    
    var buttomText : String = "Protocols are awesome"
    
    func buttonPressed(){
        print("buttom was pressed")
    }
}


class AlternativetDataSource: ButtonTextProtocol {
    
    var buttomText : String = "Protocols are NOT awesome"
}

struct ContentView: View {
    
    //sets it equal to an instance of colorThere //inits instance of colorTheme
    //let colorTheme: DefaultColorTheme = DefaultColorTheme()
    
    let colorTheme: ColorThemeProtocol = DefaultColorTheme()
    let dataSource: ButtonDataSourceProtocol
    //let dataSource2: ButtonPressedProtocol = DefaultDataSource()
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            Text(dataSource.buttomText)
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
                .onTapGesture {
                    dataSource.buttonPressed()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dataSource: DefaultDataSource())
    }
}
