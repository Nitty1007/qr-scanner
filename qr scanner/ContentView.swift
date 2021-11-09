//
//  ContentView.swift
//  qr scanner
//
//  Created by Nitay Patel on 11/5/21.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started."
    
    var ScannerSheet : some View{
        CodeScannerView(
            codeTypes:[.qr],
            completion:  { result in
                if case let .sucess(code) = result {
                    self.scannedCode = scannedCode
                    self.isPresentingScanner = false
                
                }
            }
        )
    }
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
            
            Button("Scan QR Code") {
                self.isPresentingScanner = true
                
                }
            .sheet(isPresented:$isPresentingScanner) {
                self.ScannerSheet
            }
           }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
