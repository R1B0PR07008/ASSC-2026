//
//  SwiftUIView.swift
//  Astra
//
//  Created by Riboldi  on 11/11/25.
//

import SwiftUI

func calculateAverageGPA() -> Float {
	guard !Classes.isEmpty else { return 0.0 }
	
	let totalGPA = Classes.reduce(0.0) { $0 + $1.gpa }
	return Float(totalGPA) / Float(Classes.count)
}

@available(iOS 26.0, *)
struct Profile: View {
	
	@State private var tog_prof_1 = false
	
	@State private var TeachersName = "Geo"
	@State private var ClassName = "Mr. Miles"
	@State private var GPA = "9.0"
	
	@State private var averageGPA = calculateAverageGPA()
	
	func addClass(name: String, gpa: String, teacher: String) {
		
		print("OIHDOAHDAOUWDHOAHD")
		
		print(classes(name: name, gpa: Float(gpa)!, teacher: teacher))
		
		Classes.append(classes(name: name, gpa: Float(gpa)!, teacher: teacher))
		
		print(Classes)
		
	}
	
    var body: some View {
		ZStack(alignment: .bottom) {
			ScrollView {
			
			VStack (alignment: .leading) {
				Text("Profile")
					.foregroundStyle(text2)
					.font(.system(size: 50,weight: .bold, design: .default))
					.padding(.bottom, 10)
				
				RoundedRectangle(cornerRadius: 20)
					.frame(width: 750, height: 140)
					.overlay(
						
						HStack {
							VStack (alignment: .leading) {
								Text("Account")
									.font(.system(size: 40, weight: .bold, design: .default))
								
								Spacer()
									.frame(height: 5)
								
								Text("Name and Last Name")
									.font(.system(size: 30, weight: .bold, design: .default))
								
								Spacer()
									.frame(height: 5)
								
								Text("Email@iCloud.com")
									.font(.system(size: 20, weight: .bold, design: .default))
									.foregroundStyle(text)
							}
							
							Spacer()
							
							Image(systemName: "person.crop.circle")
								.resizable()
								.frame(width: 90, height: 90)
								.padding(.trailing, 20)
							
						}
							.padding(20)
							.foregroundStyle(text)
						
					)
					.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
				
				HStack{
					RoundedRectangle(cornerRadius: 20)
						.frame(width: 370, height: 55)
						.overlay(
							
							HStack {
								
								Text("Current GPA: ")
									.font(.system(size: 27, weight: .bold, design: .default))
								
								Text("\(calculateAverageGPA(), specifier: "%.2f")")
									.font(.system(size: 27, weight: .bold, design: .default))
								
								
							}
								.padding(20)
								.foregroundStyle(text)
							
						)
						.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
					
					RoundedRectangle(cornerRadius: 20)
						.frame(width: 370, height: 55)
						.overlay(
							
							HStack {
								
								Text("Target GPA: ")
									.font(.system(size: 27, weight: .bold, design: .default))
								
								Text("9.5")
									.font(.system(size: 27, weight: .bold, design: .default))
								
								
							}
								.padding(20)
								.foregroundStyle(text)
							
						)
						.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
				}
				
				RoundedRectangle(cornerRadius: 20)
					.frame(width: 750, height: 300)
					.overlay(
						VStack (alignment: .leading) {
							
							Text("Your Classes")
								.font(.system(size: 40, weight: .bold, design: .default))
								.foregroundStyle(text)
							
							ZStack (alignment: .top) {

								ScrollView {
									ScrollViewReader { proxy in
										VStack {
											
											Spacer()
												.frame(height: 48)
											
											ForEach(Classes, id: \.self) {data in
												
												RoundedRectangle(cornerRadius: 20)
													.frame(height: 40)
													.overlay(
														HStack {
															Text(data.name)
																.font(.system(size: 20, weight: .semibold, design: .default))
																.frame(width: 200)
															
															Divider()
																.background(text)
																.frame(width: 2, height: 30)
															
															Text("\(String(format: "%.2f", data.gpa))")
																.font(.system(size: 20, weight: .semibold, design: .default))
																.frame(width: 200)
															
															Divider()
																.background(text)
																.frame(width: 2, height: 30)
															
															Text("\(data.teacher)")
																.font(.system(size: 20, weight: .semibold, design: .default))
																.frame(width: 200)
														}
															.foregroundStyle(text)
													)
													.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
											}
											
											RoundedRectangle(cornerRadius: 20)
												.frame(height: tog_prof_1 ? 140 : 40)
												.overlay(
													VStack {
														if tog_prof_1 {
															VStack {
																HStack {
																	VStack {
																		Text("Name")
																			.font(.system(size: 20, weight: .semibold, design: .default))
																			
																		
																		RoundedRectangle(cornerRadius: 20)
																			.frame(height: 40)
																			.overlay(
																				TextField("Class' Name", text: $ClassName)
																					.padding()
																					.font(.system(size: 20, weight: .semibold))
																					.padding(.leading, 10)
																					.foregroundStyle(text2)
																			)
																			.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
																		
																		
																	}
																	.frame(width: 200)
																	
																	Divider()
																		.background(text)
																		.frame(width: 2, height: 30)
																	
																	VStack {
																	
																		Text("GPA")
																			.font(.system(size: 20, weight: .semibold, design: .default))
																			
																	
																		RoundedRectangle(cornerRadius: 20)
																			.frame(height: 40)
																			.overlay(
																				TextField("Your GPA", text: $GPA)
																					.padding()
																					.font(.system(size: 20, weight: .semibold))
																					.padding(.leading, 10)
																					.foregroundStyle(text2)
																			)
																			.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
																	
																	
																	}
																	.frame(width: 200)
																	
																	Divider()
																		.background(text)
																		.frame(width: 2, height: 30)
																
																	VStack {
																	
																		Text("Teacher's Name")
																			.font(.system(size: 20, weight: .semibold, design: .default))
																			
																		
																		RoundedRectangle(cornerRadius: 20)
																			.frame(height: 40)
																			.overlay(
																				TextField("Teacher's Name", text: $TeachersName)
																					.padding()
																					.font(.system(size: 20, weight: .semibold))
																					.padding(.leading, 10)
																					.foregroundStyle(text2)
																			)
																			.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
																
																
																	}
																	.frame(width: 200)
																}
																	.foregroundStyle(text)
																
																Button(action: {
																	addClass(name: ClassName, gpa: GPA, teacher: TeachersName)
																	print("IM ALIVE ")
																}) {
																	RoundedRectangle(cornerRadius: 20)
																		.frame(width: 100, height: 40)
																		.overlay(
																			Text("Submit")
																				.font(.system(size: 20, weight: .semibold, design: .default))
																				.foregroundStyle(text)
																		)
																		.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
																}
																.buttonStyle(.plain)
																	
																
															}
															
														}
														else {
															HStack {
																Text("Add more Classes")
																	.font(.system(size: 20, weight: .semibold, design: .default))
																	}
																	.foregroundStyle(text)
																	.frame(maxWidth: .infinity, maxHeight: .infinity) // Fill the space
																	.contentShape(Rectangle()) // Make entire area tappable
																	.onTapGesture {
																		withAnimation {
																			tog_prof_1.toggle()
																		}
																	}
														}
													}
												)
												.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
//												.onTapGesture{
//													withAnimation {
//														tog_prof_1.toggle()
//													}
//												}
											
										}
									}
								}
								
								RoundedRectangle(cornerRadius: 20)
									.frame(height: 40)
									.overlay(
										HStack {
											Text("Name")
												.font(.system(size: 20, weight: .semibold, design: .default))
												.frame(width: 200)
											
											Divider()
												.background(text)
												.frame(width: 2, height: 30)
											
											Text("GPA")
												.font(.system(size: 20, weight: .semibold, design: .default))
												.frame(width: 200)
											
											Divider()
												.background(text)
												.frame(width: 2, height: 30)
											
											Text("Teacher")
												.font(.system(size: 20, weight: .semibold, design: .default))
												.frame(width: 200)
										}
											.foregroundStyle(text)
									)
									.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
									
							}
							
							/// sutff to add:
						
							/// 1. budget
							/// 2. ability to add more classes
							/// 3. ability to add more transcripts and letters of recomendation
								
						}
							.padding(20)
						
						
					)
					.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
				
				
					HStack {
						RoundedRectangle(cornerRadius: 20)
							.frame(width: 370, height: 460)
							.overlay (
								VStack (alignment: .leading) {
									Text("Extracuriculars")
										.font(.system(size: 35, weight: .bold, design: .default))
										.foregroundStyle(text)
									
									ZStack (alignment: .top) {
										ScrollView {
											VStack {
												
												Spacer()
													.frame(height: 48)
												
												ForEach(Extras, id: \.self) {data in
													RoundedRectangle(cornerRadius: 20)
														.frame(height: 40)
														.overlay(
															HStack {
																
																Text(data.name)
																	.frame(width: 90)
																	.font(.system(size: 20, weight: .semibold, design: .default))
																
																Divider()
																	.background(text)
																	.frame(width: 2, height: 30)
																
																Text(data.role)
																	.frame(width: 90)
																	.font(.system(size: 20, weight: .semibold, design: .default))
																
																Divider()
																	.background(text)
																	.frame(width: 2, height: 30)
																
																Text(String(format: "%.2f", data.hours))
																	.frame(width: 90)
																	.font(.system(size: 20, weight: .semibold, design: .default))
																
															}
																.foregroundStyle(text)
														)
														.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
													
												}
											}
										}
										
										HStack {
																				
																				
												RoundedRectangle(cornerRadius: 20)
													.frame(height: 40)
													.overlay(
														HStack {
															Text("Name")
																.frame(width: 90)
																.font(.system(size: 20, weight: .semibold, design: .default))
																						
															Divider()
																.background(text)
																.frame(width: 2, height: 30)
																					
															Text("role")
																.frame(width: 90)
																.font(.system(size: 20, weight: .semibold, design: .default))
																							
															Divider()
																.background(text)
																.frame(width: 2, height: 30)
																							
															Text("Hours")
																.frame(width: 90)
																.font(.system(size: 20, weight: .semibold, design: .default))
														}
															.foregroundStyle(text)
													)
													.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
															
											}
									}
									
								}
									.padding(20)
									
							)
							.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
						
						RoundedRectangle(cornerRadius: 20)
							.frame(width: 370, height: 460)
							.overlay (
								VStack (alignment: .leading) {
									Text("Transcripts")
										.font(.system(size: 35, weight: .bold, design: .default))
										.foregroundStyle(text)
										
									
									ZStack (alignment: .top) {
										ScrollView {
											VStack {
												
												Spacer()
													.frame(height: 48)
												
												ForEach(Transcripts, id: \.self) {data in
												
													RoundedRectangle(cornerRadius: 20)
														.frame(height: 40)
														.overlay(
															HStack {
														
																Text(data.grade)
																	.frame(width: 90)
																	.font(.system(size: 20, weight: .semibold, design: .default))
																
																Divider()
																	.background(text)
																	.frame(width: 2, height: 30)
																
																Text(data.school)
																	.frame(width: 90)
																	.font(.system(size: 20, weight: .semibold, design: .default))
																
															}
															.foregroundStyle(text)
														)
														.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
													
												}
											}
										}
										RoundedRectangle(cornerRadius: 20)
											.frame(height: 40)
											.overlay(
												HStack {
													
													Text("Grade")
														.frame(width: 90)
														.font(.system(size: 20, weight: .semibold, design: .default))
													
													Divider()
														.background(text)
														.frame(width: 2, height: 30)
													
													Text("School")
														.frame(width: 90)
														.font(.system(size: 20, weight: .semibold, design: .default))
													
												}
												.foregroundStyle(text)
											)
										.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
										
									}
									.frame(height: 140)
									
									Text("Recomendation Letters")
										.font(.system(size: 30, weight: .bold, design: .default))
										.foregroundStyle(text)
									
									ZStack (alignment: .top) {
										ScrollView {
											VStack {
												
												Spacer()
													.frame(height: 48)
												
												ForEach(Recon_letters, id: \.self) {data in
												
													RoundedRectangle(cornerRadius: 20)
														.frame(height: 40)
														.overlay(
															HStack {
														
																Text(data.name)
																	.frame(width: 130)
																	.font(.system(size: 20, weight: .semibold, design: .default))
																
																Divider()
																	.background(text)
																	.frame(width: 2, height: 30)
																
																Text(data.state)
																	.frame(width: 90)
																	.font(.system(size: 20, weight: .semibold, design: .default))
																
															}
															.foregroundStyle(text)
														)
														.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
													
												}
											}
										}
										
										RoundedRectangle(cornerRadius: 20)
											.frame(height: 40)
											.overlay(
												HStack {
													
													Text("Teacher")
														.frame(width: 130)
														.font(.system(size: 20, weight: .semibold, design: .default))
													
													Divider()
														.background(text)
														.frame(width: 2, height: 30)
													
													Text("State")
														.frame(width: 90)
														.font(.system(size: 20, weight: .semibold, design: .default))
													
												}
												.foregroundStyle(text)
											)
										.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
										
									}
									
									
									
								}
									.padding(20)
							)
							.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
					}
				
				
			}
			
			
				
				
				
			}
		}
    }
}

@available(iOS 26.0, *)
#Preview {
	Profile()
		
}
