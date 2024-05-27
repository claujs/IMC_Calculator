import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var result: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Calculadora de IMC")
                .font(.largeTitle)
                .padding()
            
            HStack {
                Text("Peso (kg):")
                TextField("Digite seu peso", text: $weight)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            HStack {
                Text("Altura (cm):")
                TextField("Digite sua altura", text: $height)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            Button(action: calculateBMI) {
                Text("Calcular IMC")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Text(result)
                .font(.title)
                .padding()
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.quaternaryLabel).edgesIgnoringSafeArea(.all)) // Cor de fundo adicionada aqui
    }
    
    func calculateBMI() {
        guard let weight = Double(weight), let height = Double(height) else {
            result = "Por favor, insira valores válidos."
            return
        }
        
        let heightInMeters = height / 100
        let bmi = weight / (heightInMeters * heightInMeters)
        
        result = String(format: "Seu IMC é %.2f", bmi)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
