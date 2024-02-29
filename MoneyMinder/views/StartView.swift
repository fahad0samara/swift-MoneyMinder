import SwiftUI

struct StartView: View {
    @State private var isGetStartedClicked = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.green, Color.black]), startPoint: .center, endPoint: .top)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Image(systemName: "dollarsign.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .foregroundColor(.white)
                    
                    Text("Welcome to MoneyMinder")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Start exploring currencies and exchange rates!")
                        .font(.title)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center).italic()
                    
                    Spacer()
                    
                    Button(action: {
                        isGetStartedClicked = true
                    }) {
                        Text("Get Started")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.white)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            
                    }
                    .fullScreenCover(isPresented: $isGetStartedClicked) {
                        TabBarView()
                    }
                    
                    Text("Learn More")
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
                .padding()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
