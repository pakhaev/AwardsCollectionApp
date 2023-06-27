//
//  ShipView.swift
//  AwardsCollectionApp
//
//  Created by Khusain on 26.06.2023.
//

import SwiftUI

struct ShipView: View {
    var body: some View {
        GeometryReader { geometry in
            let brownColor = Color("brownColor")
            let milkColor = Color("milkColor")
            let orangeColor = Color("orangeColor")
            let grayFlagColor = Color("grayFlagColor")
            let grayFlagColorDark = Color("grayFlagColorDark")
            
            let size = min(geometry.size.width, geometry.size.height)
            let lineWidth = size * 0.01
            
            let mainmastUpHeight = size * 0.05
            let mainmastUpWidth = size * 0.2667
            
            let crowsHeightMin = size * 0.085
            let crowsHeightMax = size * 0.135
            
            let crowsWidth = size * 0.168
            
            Group {
                //Верхняя маленькая палочка
                Path { path in
                    path.move(to: CGPoint(x: mainmastUpWidth, y: mainmastUpHeight))
                    path.addLine(to: CGPoint(x: mainmastUpWidth, y: mainmastUpHeight * 1.6))
                }
                .stroke(
                    brownColor,
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                
                //Верхнее гнездо
                Path { path in
                    path.move(to: CGPoint(x: crowsWidth, y: crowsHeightMin))
                    path.addLine(to: CGPoint(x: crowsWidth * 2.2, y: crowsHeightMin))
                    path.addLine(to: CGPoint(x: crowsWidth * 1.9, y: crowsHeightMax))
                    path.addLine(to: CGPoint(x: crowsWidth * 1.3, y: crowsHeightMax))
                    path.closeSubpath()
                }
                .fill(brownColor)
                .overlay(
                    Path { path in
                        path.move(to: CGPoint(x: crowsWidth, y: crowsHeightMin))
                        path.addLine(to: CGPoint(x: crowsWidth * 2.2, y: crowsHeightMin))
                        path.addLine(to: CGPoint(x: crowsWidth * 1.9, y: crowsHeightMax))
                        path.addLine(to: CGPoint(x: crowsWidth * 1.3, y: crowsHeightMax))
                        path.closeSubpath()
                    }
                        .stroke(
                            brownColor,
                            style: StrokeStyle(
                                lineWidth: lineWidth * 0.5,
                                lineCap: .round,
                                lineJoin: .round
                            )
                        )
                )
                
                //Длинная палочка + маленький угол
                Path { path in
                    path.move(to: CGPoint(x: mainmastUpWidth, y: crowsHeightMax))
                    path.addLine(to: CGPoint(x: mainmastUpWidth, y: crowsHeightMax * 5))
                    path.addLine(to: CGPoint(x: mainmastUpWidth * 1.3, y: crowsHeightMax * 5))
                    path.addLine(to: CGPoint(x: mainmastUpWidth * 1.25, y: crowsHeightMax * 5.2))
                    
                    path.addLine(to: CGPoint(x: mainmastUpWidth * 0.94, y: crowsHeightMax * 5.35))
                    path.closeSubpath()
                }
                .stroke(brownColor, lineWidth: size * 0.042)
                
                //Штука слева которая
                Path { path in
                    path.move(to: CGPoint(x: 1, y: crowsHeightMax * 4))
                    path.addLine(to: CGPoint(x: size * 0.235, y: crowsHeightMax * 4))
                    path.addLine(to: CGPoint(x: size * 0.235, y: crowsHeightMax * 5.35))
                    
                    path.addCurve(
                        to: CGPoint(x: 1, y: crowsHeightMax * 4),
                        control1: CGPoint(x: 1, y: crowsHeightMax * 5.1),
                        control2: CGPoint(x: 1, y: crowsHeightMax * 5)
                    )
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [orangeColor, brownColor]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                
                //Перила слева закрашивание
                Path { path in
                    path.move(to: CGPoint(x: size * 0.03, y: crowsHeightMax * 4.5))
                    path.addLine(to: CGPoint(x: size * 0.235, y: crowsHeightMax * 4.5))
                }
                .stroke(
                    .white,
                    style: StrokeStyle(lineWidth: size * 0.05, dash: [size * 0.04])
                )
            }
            
            Group {
                //Нижняя часть
                Path { path in
                    path.move(to: CGPoint(x: size * 0.2, y: crowsHeightMax * 5.35))
                    path.addLine(to: CGPoint(x: size * 0.867, y: crowsHeightMax * 5.35))
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.6, y: crowsHeightMax * 7),
                        control1: CGPoint(x: size * 0.833, y: crowsHeightMax * 6),
                        control2: CGPoint(x: size * 0.867, y: crowsHeightMax * 7)
                    )
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.2, y: crowsHeightMax * 5.4),
                        control1: CGPoint(x: size * 0.167, y: crowsHeightMax * 7),
                        control2: CGPoint(x: size * 0.2, y: crowsHeightMax * 5)
                    )
                }
                .fill(brownColor)
                
                
                //Окошки
                Group {
                    createCircle(
                        x: size * 0.367,
                        y: size * 0.85,
                        radius: size * 0.033,
                        color: .blue
                    )
                    createCircle(
                        x: size * 0.5,
                        y: size * 0.85,
                        radius: size * 0.033,
                        color: .blue
                    )
                    createCircle(
                        x: size * 0.633,
                        y: size * 0.85,
                        radius: size * 0.033,
                        color: .blue
                    )
                }
                
                Path { path in
                    path.move(to: CGPoint(x: size * 0.85, y: size * 0.616))
                    path.addLine(to: CGPoint(x: size * 0.933, y: size * 0.616))
                    path.addLine(to: CGPoint(x: size * 0.933, y: size * 0.633))
                    path.addLine(to: CGPoint(x: size * 0.85, y: size * 0.633))
                }
                .stroke(
                    brownColor,
                    style: StrokeStyle(
                        lineWidth: size * 0.02,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                
                
            
                //Правая полукруглая часть
                Path { path in
                    path.move(to: CGPoint(x: size * 0.533, y: crowsHeightMax * 5.37))
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.6, y: crowsHeightMax * 4),
                        control1: CGPoint(x: size * 0.467, y: crowsHeightMax * 5.37),
                        control2: CGPoint(x: size * 0.533, y: crowsHeightMax * 5.5)
                    )
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.65, y: crowsHeightMax * 3.8),
                        control1: CGPoint(x: size * 0.609, y: crowsHeightMax * 3.81),
                        control2: CGPoint(x: size * 0.633, y: crowsHeightMax * 3.82)
                    )
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.86, y: crowsHeightMax * 4.5),
                        control1: CGPoint(x: size * 0.84, y: crowsHeightMax * 3.8),
                        control2: CGPoint(x: size * 0.85, y: crowsHeightMax * 3.82)
                    )
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.867, y: crowsHeightMax * 5.37),
                        control1: CGPoint(x: size * 0.86, y: crowsHeightMax * 4.5),
                        control2: CGPoint(x: size * 0.863, y: crowsHeightMax * 4.9)
                    )
                }
                .fill(brownColor)
                
                //Перила справа
                Path { path in
                    path.move(to: CGPoint(x: size * 0.6, y: crowsHeightMax * 4.5))
                    path.addLine(to: CGPoint(x: size * 0.86, y: crowsHeightMax * 4.5))
                }
                .stroke(
                    .white,
                    style: StrokeStyle(lineWidth: size * 0.05, dash: [size * 0.033])
                )
            }
            
            createCircle(
                x: size * 0.767,
                y: size * 0.735,
                radius: size * 0.04,
                color: .gray
            )
            
            createCircle(
                x: size * 0.767,
                y: size * 0.735,
                radius: size * 0.02,
                color: .white
            )
            
            Path { path in
                path.move(to: CGPoint(x: size * 0.75, y: size * 0.766))
                path.addLine(to: CGPoint(x: size * 0.783, y: size * 0.766))
                path.addLine(to: CGPoint(x: size * 0.783, y: size * 0.817))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.8))
                
                path.addLine(to: CGPoint(x: size * 0.817, y: size * 0.817))
                path.addLine(to: CGPoint(x: size * 0.766, y: size * 0.85))
                
                path.addLine(to: CGPoint(x: size * 0.717, y: size * 0.817))
                path.addLine(to: CGPoint(x: size * 0.734, y: size * 0.8))
                path.addLine(to: CGPoint(x: size * 0.75, y: size * 0.817))
                
            }
            .fill(.gray)
            
            //Длинная палочка
            Path { path in
                path.move(to: CGPoint(x: size * 0.767, y: mainmastUpHeight))
                path.addLine(to: CGPoint(x: size * 0.8, y: mainmastUpHeight))
                path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.533))
                path.addLine(to: CGPoint(x: size * 0.767, y: size * 0.533))
            }
            .fill(brownColor)
            
            //Флаг справа
            Group {
                Path { path in
                    path.move(to: CGPoint(x: size * 0.666, y: size * 0.1))
                    path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.1))
                    path.addLine(to: CGPoint(x: size * 0.8, y: size * 0.2))
                    path.addLine(to: CGPoint(x: size * 0.666, y: size * 0.2))
                }
                .fill(grayFlagColor)
                
                Path { path in
                    path.move(to: CGPoint(x: size * 0.666, y: size * 0.133))
                    path.addLine(to: CGPoint(x: size * 0.566, y: size * 0.133))
                    path.addLine(to: CGPoint(x: size * 0.616, y: size * 0.183))
                    path.addLine(to: CGPoint(x: size * 0.566, y: size * 0.233))
                    path.addLine(to: CGPoint(x: size * 0.666, y: size * 0.233))
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [grayFlagColor, grayFlagColorDark]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                
                Path { path in
                    path.move(to: CGPoint(x: size * 0.65, y: size  * 0.283))
                    
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.65, y: size * 0.45),
                        control1: CGPoint(x: size * 0.65, y: size  * 0.283),
                        control2: CGPoint(x: size * 0.7, y: size * 0.366)
                    )
                    
                    path.addLine(to: CGPoint(x: size * 0.866, y: size * 0.45))
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.866, y: size  * 0.283),
                        control1: CGPoint(x: size * 0.866, y: size * 0.433),
                        control2: CGPoint(x: size * 0.933, y: size * 0.383)
                    )
                }
                .fill(milkColor)
                
                //Перила справа
                Path { path in
                    path.move(to: CGPoint(x: size * 0.7, y: size * 0.3666))
                    path.addLine(to: CGPoint(x: size * 0.866, y: size * 0.3666))
                }
                .stroke(
                    grayFlagColor,
                    style: StrokeStyle(lineWidth: size * 0.167, dash: [size * 0.05])
                )
            }
            
            Group {
                //Флаг
                Path { path in
                    path.move(to: CGPoint(x: size * 0.017, y: size * 0.2))
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.05, y: size * 0.466),
                        control1: CGPoint(x: size * 0.05, y: size * 0.2),
                        control2: CGPoint(x: size * 0.166, y: size * 0.33)
                    )
                    
                    path.addLine(to: CGPoint(x: size * 0.433, y: size * 0.466))
                    
                    path.addCurve(
                        to: CGPoint(x: size * 0.433, y: size * 0.2),
                        control1: CGPoint(x: size * 0.433, y: size * 0.466),
                        control2: CGPoint(x: size * 0.5, y: size * 0.35)
                    )
                }
                .fill(milkColor)
                
                //Рисунок флага
                Path { path in
                    path.move(to: CGPoint(x: size * 0.2, y: size * 0.267))
                    path.addLine(to: CGPoint(x: size * 0.37, y: size * 0.4))
                    path.addLine(to: CGPoint(x: size / 3, y: size * 0.4))
                    path.addLine(to: CGPoint(x: size * 0.167, y: size * 0.267))
                }
                .fill(.gray)
                //Рисунок флага
                Path { path in
                    path.move(to: CGPoint(x: size * 0.37, y: size * 0.267))
                    path.addLine(to: CGPoint(x: size * 0.2, y: size * 0.4))
                    path.addLine(to: CGPoint(x: size * 0.167, y: size * 0.4))
                    path.addLine(to: CGPoint(x: size / 3, y: size * 0.267))
                }
                .fill(.gray)
            }
        }
    }
    
    private func createCircle(x: Double, y: Double, radius: Double, color: Color) -> some View {
        return Path { path in
            path.addArc(
                center: CGPoint(x: x, y: y),
                radius: radius,
                startAngle: .degrees(360),
                endAngle: .degrees(0),
                clockwise: true
            )
        }
        .fill(color)
    }
    
}

struct ShipView_Previews: PreviewProvider {
    static var previews: some View {
        ShipView()
            .frame(width: 300, height: 300)
    }
}
