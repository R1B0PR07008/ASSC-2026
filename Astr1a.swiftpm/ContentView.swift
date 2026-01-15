import SwiftUI
import Charts

// MARK: -def colors

let back = Color(UIColor(named: "Back")!)
let back2 = Color(UIColor(named: "back2")!)
let text = Color(UIColor(named: "text")!)
let text2 = Color(UIColor(named: "text2")!)

// MARK: -funcs

/// pie graph
struct PieData: Identifiable {
	let id = UUID()
	let label: String
	let value: Double
}

@available(iOS 26.0, *)
struct Home: View {

	@State private var expandedItemID: UUID? = nil
	
	var body: some View {
		
	}
}

@available(iOS 26.0, *)
struct verticalView: View {
	
	@State var selector = false
	
	var body: some View {
		
	}
}


@available(iOS 26.0, *)
struct ContentView: View {
    var body: some View {
		verticalView()
    }
}
