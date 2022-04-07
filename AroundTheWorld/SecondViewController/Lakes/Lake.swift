//
//  Lake.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 06.04.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation


class SwiftUIViewHostingController4: UIHostingController<Lake> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: Lake())
    }
}

struct Lake: View {
    var body: some  View{
        Home()
    }
}

struct Home: View{
    @State var data2 = [
        
        LakeData(id: 0, imageLake: "байкал", cntry2: "Россия", plce2: "озеро Байкал", detailss2: "Озеро Байкал расположено на юге Восточной Сибири. Это самое глубокое озеро на планете, крупнейший природный резервуар пресной воды и самое большое по площади пресноводное озеро на континенте. Максимальная его глубина 1642 м. Это озеро содержит 19% всей пресной воды, содержащейся в озёрах мира. В Байкал впадает 336 рек, а вытекает только одна – Ангара."),
        LakeData(id: 1, imageLake: "таль", cntry2: "Филипины", plce2: "озеро Тааль", detailss2: "Пресноводное озеро Филиппин. Находится на острове Лусон, в провинции Батангас. Озеро заполняет большую вулканическую кальдеру Тааль, образованную очень большим извержением примерно 500 000—100 000 лет назад. Площадь 234,2 км². Максимальная глубина 172 м."),
        LakeData(id: 2, imageLake: "морейн", cntry2: "США", plce2: "озеро Морейн", detailss2: "Находится в национальном парке Банф, Канада. Питается озеро исключительно ледниками. Когда оно наполнено, в нём отражаются различные оттенки синего из-за преломления света на каменистом дне озера. Площадь 0,5 км². Максимальная глубина 14 м."),
        LakeData(id: 3, imageLake: "хиллиер", cntry2: "Австралия", plce2: "озеро Хилиер", detailss2: "Розовое озеро в Австралии не впечатляет своими размерами. Длина водоема Хиллер составляет всего 600 метров, а ширина — 250 метров. Глубина озера неизвестна по сей день и как следует не измерена, однако существуют предположения, что она довольно небольшая."),
        LakeData(id: 4, imageLake: "виктория", cntry2: "Восточная африка", plce2: "озеро Виктория", detailss2: "Озер Виктория находится на востоке Африки. Озеро пресное, довольно крупное по площади. Максимальная длина 320 км, ширина – 274 км. Самая большая глубина 40 м. Его ставят на 2 место по площади. На первом озеро Верхнее в Северной Америке. "),
    ]

    @State var index2 = 0
    @State var show2  = false
    var body: some View{
        ZStack{
            //Добавление фонового изображения на экран
            GeometryReader{
                geo in
                Image ("фоник")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width,
                           height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack{
                    
                    HStack{
                        Text("Озера")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(30)
                        
                        Spacer()
                        
                        Text ("\(self.index2 + 1)/\(self.data2.count)")
                            .foregroundColor(.white)
                    }
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding()
                    
                    GeometryReader{g in
                        Carousel2(data2: self.$data2, index2: self.$index2, show2: self.$show2, size: g.frame(in: .global))
                    }
                    
                    .padding(.bottom,
                             (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 10)
                    
                }
                
                //Cкрытие представления при появлении расширенного представления
                .opacity(self.show2 ? 0 : 1)
                //Текущий индекс даст текущую карточку
                if #available(iOS 14.0, *) {
                    ExpandView2(data2: self.$data2[self.index2], show2: self.$show2)
                    //Уменьшение представления на фоне
                        .scaleEffect(self.show2 ? 1 : 0)
                        .frame(width: self.show2 ? nil : 0 , height: self.show2 ? nil : 0)
                } else {
                    // Fallback on earlier versions
                }
            }
            .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    
    struct HScrollView2: View{
        @Binding var data2: [LakeData]
        //Расширение представления
        @Binding var show2: Bool
        var size: CGRect
        
        var body: some View{
            HStack(spacing:0){
                
                ForEach(self.data2){i in
                    ZStack(alignment: .bottom){
                        
                        Image(i.imageLake)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: self.size.width - 30, height: self.size.height)
                            .cornerRadius(25)
                        //Избегание занимания дополнительного места .fill с помощью .contentShape
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation{
                                    //Открытие расширенного представления при нажатии на изображение
                                    self.show2.toggle()
                                }
                            }
                        VStack(alignment: .leading, spacing: 12){
                            Text(i.plce2)
                            
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            HStack(spacing:12){
                                
                                Image(systemName: "mappin.circle.fill")
                                    .font(.system(size: 25, weight: .bold))
                                
                                Text(i.cntry2)
                                    .foregroundColor(.white)
                            }
                            
                            Text(i.detailss2)
                            
                        }
                        .padding(.horizontal, 25)
                        .padding(.bottom, 20)
                        .foregroundColor(.white)
                        
                    }
                    
                    .frame(width: self.size.width, height: self.size.height)
                }
                
            }
        }
    }
    
    struct Carousel2: UIViewRepresentable {
        
        
        func makeCoordinator() -> Coordinator {
            return Carousel2.Coordinator(parent1: self)
        }
        @Binding var data2: [LakeData]
        @Binding var index2: Int
        @Binding var show2: Bool
        var size:  CGRect
        
        func makeUIView(context: Context) -> UIScrollView{
            let view = UIScrollView()
            //Каждая задача просмотра имеет полную ширину, поэтому размер содержимого будет * total count
            view.contentSize = CGSize(width: size.width * CGFloat(data2.count), height: size.height)
            
            let child = UIHostingController(rootView: HScrollView2(data2: self.$data2, show2: self.$show2, size: self.size))
            child.view.backgroundColor = .clear
            child.view.frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data2.count), height: size.height)
            
            view.addSubview(child.view)
            view.showsVerticalScrollIndicator = false
            view.showsHorizontalScrollIndicator = false
            view.isPagingEnabled = true
            view.delegate = context.coordinator
            
            return view
        }
        
        
        //Динамическое обновление при добавлении новых данных на представлении
        func updateUIView(_ uiView: UIScrollView, context: Context) {
            
            for i in 0..<uiView.subviews.count{
                
                uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data2.count), height: size.height)
            }
            
            uiView.contentSize = CGSize(width: size.width * CGFloat(data2.count), height: size.height)
        }
        
        class Coordinator: NSObject, UIScrollViewDelegate{
            var parent: Carousel2
            
            init(parent1: Carousel2){
                
                parent = parent1
            }
            
            
            func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
                let index = Int(scrollView.contentOffset.x/UIScreen.main.bounds.width)
                
                parent.index2 = index
            }
        }
    }
    
    
    @available(iOS 14.0, *)
    struct ExpandView2: View{
        @Environment(\.openURL) var openURL3
        @Binding var data2: LakeData
        @Binding var show2: Bool
        
        var body: some View{
            VStack{
                
                //Кнопка закрытия
                
                ZStack(alignment:.bottomTrailing){
                    Image(self.data2.imageLake)
                        .resizable()
                        .cornerRadius(25)
                    
                    Image(self.data2.imageLake)
                        .resizable()
                        .cornerRadius(25)
                    
                    Button {
                        print("dad")
                        withAnimation{
                            self.show2.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                            .frame( alignment: .trailing)
                    }
                            .padding(.trailing)
                        .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! )
                    
                }
                
                //                Button {
                //                    print("dad")
                //                    withAnimation{
                //                        self.show.toggle()
                //                    }
                //                } label: {
                //                    Text("hsdjahsdbhj")
                //                }
                
                
                //                Image(self.data.imageMount)
                //                    .resizable()
                //                    .cornerRadius(25)
                
                VStack(alignment: .leading, spacing: 12){
                    
                    Text(self.data2.plce2)
                    
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    HStack(spacing:12){
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 25, weight: .bold))
                        
                        Text(self.data2.cntry2)
                            .foregroundColor(.white)
                    }
                    
                    Text(self.data2.detailss2)
                    
                }
                .padding(.horizontal, 25)
                .padding(.bottom, 20)
                .foregroundColor(.white)
                .padding(.top)
                
                HStack(spacing: 15){
                    
                    Text("Более подробно можете узнать здесь")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding(.leading, 20)
                Spacer()
                
                Button(action:{openURL3(URL(string: "https://clck.ru/NCSUj")!)
                    
                }){
                    Text("Перейти")
                        .foregroundColor(.white)
                        .font(.system(size:22))
                        .padding(.vertical, 25)
                        .frame(width: UIScreen.main.bounds.width / 2.5)
                        .background(Color("Color3"))
                        .clipShape(CShape())
                }
            }
            
        }
        
    }
    
    //Кастомная форма
    struct CShape: Shape{
        
        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.bottomRight], cornerRadii: CGSize(width: 55, height: 55))
            return Path(path.cgPath)
        }
    }
    
}
//Скрытие домашнего индикатора
class Hosts2 : UIHostingController<Lake>{
    override var prefersHomeIndicatorAutoHidden: Bool{
        return true
    }
}
