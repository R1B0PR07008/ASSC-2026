import SwiftUI

@available(iOS 26.0, *)
struct ContentView: View {
	
	@Environment(\.colorScheme) var colorScheme
	
	var body: some View {
		ZStack {
			
			VStack {
				
				ScrollView(.vertical) {
					VStack(spacing: 0) {
						ForEach(1..<16, id: \.self) { i in
							ZStack {

								Image("\(i)")
									.resizable()
									.scaledToFill()
									.frame(
										maxWidth: .infinity,
										maxHeight: UIScreen.main.bounds.height * 0.85
									)
									.clipShape(RoundedRectangle(cornerRadius: 55))
							}
							.containerRelativeFrame(.vertical, count: 1, spacing: 0) // page = full screen
							.scrollTargetLayout()
							.ignoresSafeArea()
						}
					}
				}
				.scrollTargetBehavior(.paging)
				.scrollIndicators(.hidden)
				.padding(.horizontal, 10)
				.padding(.top, 15)
					
			}
			
			Rectangle()
				.fill(
					LinearGradient(gradient: Gradient(colors: colorScheme == .dark ? [Color.black.opacity(0.0), Color.black.opacity(0.9), Color.black.opacity(1)] : [Color.white.opacity(0.0), Color.white.opacity(0.9), Color.white.opacity(1)]), startPoint: .bottom, endPoint: .top)
				)
				.frame(maxWidth: .infinity, maxHeight: 100)
				.ignoresSafeArea(edges: .all)
				.padding(.bottom, 780)

		}
    }
}

/// revise this, maybe keep the custom tabview to make sure colors match.

@available(iOS 26.0, *)
struct TabView_: View {
	
	@State var showSearch = false
	
	var body: some View {
		ZStack {
			TabView {
				ContentView()
					.tabItem {
						Label("Home", systemImage: "house.fill")
					}
					.tag(0)
				
				// Hidden tab for spacing
				SchoolInfo()
					.tabItem {
						Label("School Info", systemImage: "graduationcap.fill")
					}
					.tag(1)
			}
			
			// Floating search button
			VStack {
				Spacer()
				HStack {
					Spacer()
					
					Circle()
						.glassEffect()
						.frame(width: 60, height: 60)
						.overlay(
							Button(action: {
								showSearch = true
							}) {
								Image(systemName: "magnifyingglass")
									.foregroundStyle(Color.white)
									.font(.system(size: 22))
							}
						)
						.padding(.trailing, 30)
						.padding(.bottom, -12)
				}
			}
		}
		.sheet(isPresented: $showSearch) {
			SearchView() // Your search view
		}
	}
}

@available(iOS 26.0, *)
#Preview {
	TabView_()
}
