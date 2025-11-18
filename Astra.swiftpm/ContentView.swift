import SwiftUI

let back = Color(UIColor(named: "Back")!)
let back2 = Color(UIColor(named: "back2")!)
let text = Color(UIColor(named: "text")!)
let text2 = Color(UIColor(named: "text2")!)

@available(iOS 26.0, *)
struct Home: View {

	@State private var expandedItemID: UUID? = nil
	
	var body: some View {
		ScrollView {
				
			VStack(alignment: .leading) {
					
					Text("Available Scholarships")
						.foregroundStyle(text2)
						.font(.system(size: 50,weight: .bold, design: .default))
					
					ForEach(mockScholarChipsData, id: \.self) { data in
						
						RoundedRectangle(cornerRadius: 20)
							.frame(width: 750, height: expandedItemID == data.id ? 400 : 200)
							.overlay {
								HStack {
									VStack (alignment: .leading) {
										Text(data.name)
											.foregroundStyle(text)
											.font(.system(size: 30, weight: .bold, design: .default))
											.padding(5)

										Text( expandedItemID == data.id ? data.description2 : data.description)
											.foregroundStyle(text)
											.font(.system(size: 20, weight: .bold, design: .default))
											.padding(5)
									}
									.frame(width: 550)

									Divider().frame(width: 1, height: expandedItemID == data.id ? 350 : 150).background(.white)
										.padding(.leading, 10)

									VStack {
										Text(data.place)
											.foregroundStyle(text)
											.font(.system(size: 20, weight: .bold, design: .default))
											.padding(10)
											.padding(.top, 50)

										Text("\(data.amount) \(data.currency)")
											.foregroundStyle(text)
											.font(.system(size: 20, weight: .bold, design: .default))
											.padding(10)

										Text("GPA: \(String(format: "%.2f", data.min_requiered_gpa))")
											.foregroundStyle(text)
											.font(.system(size: 20, weight: .bold, design: .default))
											.padding(10)
											.padding(.bottom, 50)
									}
									.frame(width: 150)
								}
								.padding(5)
							}
							.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
							.onTapGesture {
								withAnimation {
									if expandedItemID == data.id {
										expandedItemID = nil
									} else {
										expandedItemID = data.id
									}
								}
							}
						
					}
				}
			}
	}
}

@available(iOS 26.0, *)
struct verticalView: View {
	
	@State var selector = false
	
	var body: some View {
		ZStack(alignment: .bottom) {
			
			
			Home().opacity(selector ? 0 : 1)
			Profile().opacity(selector ? 1 : 0)
			
			
			HStack {
				RoundedRectangle(cornerRadius: 20)
					.fill(back)
					.frame(width: 690, height: 60)
					.overlay {
						
						/// this is likely to change!
						
						HStack {
							RoundedRectangle(cornerRadius: 15)
								.fill(back2)
								.frame(width: 80, height: 40)
								.padding(5)
								.overlay{
									Text("Home")
										.font(.system(size: 20, weight: .semibold))
								}
								.foregroundStyle(text)
								.onTapGesture {
									withAnimation (.easeInOut) {
										selector = false
									}
								}
								.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 15.0))
							
							
							RoundedRectangle(cornerRadius: 15)
								.fill(back2)
								.frame(width: 80, height: 40)
								.padding(5)
								.overlay{
									Text("Profile")
										.font(.system(size: 20, weight: .semibold))
								}
								.foregroundStyle(text)
								.onTapGesture {
									withAnimation (.easeInOut) {
										selector = true
									}
								}
								.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 15.0))
							
							RoundedRectangle(cornerRadius: 15)
								.fill(back2)
								.frame(width: 80, height: 40)
								.padding(5)
								.overlay{
									Text("Icon 3")
										.font(.system(size: 20, weight: .semibold))
								}
								.foregroundStyle(text)
								.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 15.0))
							
							RoundedRectangle(cornerRadius: 15)
								.fill(back2)
								.frame(width: 80, height: 40)
								.padding(5)
								.overlay{
									Text("Icon 4")
										.font(.system(size: 20, weight: .semibold))
								}
								.foregroundStyle(text)
								.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 15.0))
							
							RoundedRectangle(cornerRadius: 15)
								.fill(back2)
								.frame(width: 80, height: 40)
								.padding(5)
								.overlay{
									Text("Icon 5")
										.font(.system(size: 20, weight: .semibold))
								}
								.foregroundStyle(text)
								.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 15.0))
							
							RoundedRectangle(cornerRadius: 15)
								.fill(back2)
								.frame(width: 80, height: 40)
								.padding(5)
								.overlay{
									Text("Icon 6")
										.font(.system(size: 20, weight: .semibold))
								}
								.foregroundStyle(text)
								.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 15.0))
							
							RoundedRectangle(cornerRadius: 15)
								.fill(back2)
								.frame(width: 80, height: 40)
								.padding(5)
								.overlay{
									Text("Icon 7")
										.font(.system(size: 20, weight: .semibold))
								}
								.foregroundStyle(text)
								.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 15.0))
							
							/// There are 7 here btw
							
						}
					}
			}
			.glassEffect(.regular.tint(back.opacity(0.4)).interactive(), in: .rect(cornerRadius: 20.0))
			.padding(.bottom, -10)
			
		}
	}
}


@available(iOS 26.0, *)
struct ContentView: View {
    var body: some View {
		verticalView()
    }
}
