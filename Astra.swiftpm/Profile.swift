//
//  SwiftUIView.swift
//  Astra
//
//  Created by Riboldi  on 11/11/25.
//

import SwiftUI

@available(iOS 26.0, *)
struct Profile: View {
	
	@State private var tog_prof_1 = false
	
	@State private var TeachersName = "example"
	@State private var ClassName = "example"
	@State private var GPA = "9.0"
	
    var body: some View {
		ZStack(alignment: .bottom) {
			ScrollView {
			
			VStack (alignment: .leading) {
				Text("Profile")
					.foregroundStyle(text2)
					.font(.system(size: 50,weight: .bold, design: .default))
				
				RoundedRectangle(cornerRadius: 20)
					.frame(width: 750, height: 200)
					.overlay(
						
						HStack {
							VStack (alignment: .leading) {
								Text("Account")
									.font(.system(size: 40, weight: .bold, design: .default))
								
								Spacer()
									.frame(height: 20)
								
								Text("Name and Last Name")
									.font(.system(size: 30, weight: .bold, design: .default))
								
								Spacer()
									.frame(height: 10)
								
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
																
//																RoundedRectangle(cornerRadius: 20)
//																	.frame(width: 100, height: 40)
//																	.overlay(
//																		Text("Submit")
//																			.font(.system(size: 20, weight: .semibold, design: .default))
//																			.foregroundStyle(text)
//																	)
//																	.glassEffect(.regular.tint(back).interactive(), in: .rect(cornerRadius: 20.0))
//																	.onTapGesture{
//																		Classes.append(classes(name: ClassName, gpa: Float(GPA)!, teacher: TeachersName))
//																		print(Classes)
//																	}
																	
																
															}
														}
														else {
															HStack {
																Text("Add more Classes")
																	.font(.system(size: 20, weight: .semibold, design: .default))
															}
																.foregroundStyle(text)
														}
													}
												)
												.glassEffect(.regular.tint(back2).interactive(), in: .rect(cornerRadius: 20.0))
												.onTapGesture{
													withAnimation {
														tog_prof_1.toggle()
													}
												}
											
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
