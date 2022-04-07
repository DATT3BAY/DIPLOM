//
//  Mountain.swift
//  AroundTheWorld
//
//  Created by Александр Анисимов on 03.04.2022.
//  Copyright © 2022 Александр Анисимов. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

class SwiftUIViewHostingController3: UIHostingController<Mountain> {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: Mountain())
    }
}


struct Mountain: View {
    var body: some  View{
        Home2()
    }
}


struct Home2: View{
    @State var data = [
        
        MountainData(id: 0, imageMount: "тибет", cntry: "Китай", plce: "Тибет", detailss: "Площадь - 1,2 млн км². Средняя высота территории: 4000 метров над уровнем моря. На территории Тибета берёт исток ряд великих рек, которые протекают затем по территории проживания других народов(Янцзы, Инд, Желтая река. Средняя температура: 14 °C в июле и −4 °C в январе.)"),
        MountainData(id: 1, imageMount: "эверест", cntry: "Непал", plce: "Эверест", detailss: "Является самой высокой точкой нашей планеты. Возраст Эвереста - более 60 миллионов лет. Скорость ветра на вершине может достигать отметки 200 миль в час. Температура на пике может опускаться до отметки –62C. Пик расположен прямо на линии границы Непала с юга и Китая, также известного как Тибет, с северной стороны."),
        MountainData(id: 2, imageMount: "олимп", cntry: "Греция", plce: "Олимп", detailss: "Самая высокая гора Греции и одна из самых высоких в Европе, ее высота составляет 2919 метров. Сегодня гора Олимп, представляет собой массив из четырех основных вершин и более 1700 каньонов и плато на границе Фессалии и Македонии. Олимп является не только историческим и мифологическим символом, но и памятником природы. Расположенный в пределах нома Пиерия и частично в пределах нома Лариса-Фессалия, Национальный заповедник Олимпа характеризуется огромным разнообразием флоры и фауны. Здесь встречаются 1700 видов растений, что соответствует 25 % всех видов встречающихся в Греции. 23 из них — эндемичные виды, то есть обитающие только здесь. Фауна представлена 8 видами амфибий, 22 видами пресмыкающихся, 32 видами диких млекопитающих, 136 видами птиц."),
        MountainData(id: 3, imageMount: "фудзияма", cntry: "Япония", plce: "Фудзияма", detailss: "Высота вулкана Фудзияма — 3 776 метров. Возраст горы Фудзияма определяется в несколько тысячелетий. Примерно она начала формироваться 11–8 000 лет назад. Гора возникла из излившейся лавы других древних вулканов. Вулкан Фудзияма последний раз извергался в 1707 г., и ныне через его кору лишь время от времени прорываются клубы пара, подобные размеренному дыханию спящего великана."),
        MountainData(id: 4, imageMount: "килиманджаро", cntry: "Танзания", plce: "Килиманджаро", detailss: "Расположена в северо-восточной части Танзании, в одноименном национальном парке. Это высочайшая вершина Африки, которая на самом деле является спящим вулканом. Его высота достигает 5895 м над уровнем моря. На снимке из космоса хорошо видно, что в плане гора имеет овальную форму. Ее площадь достигает почти 390 тыс. гектар. Это больше, чем занимает Люксембург или Маврикий. Размеры гиганта составляют 50x70 км. Вулкан виден как на ладони, поскольку высится посреди абсолютно ровной саваны."),
    ]
    
  
    
    
    @State var index = 0
    @State var show  = false
    var body: some View{
        ZStack{
            //Добавление фонового изображения на экран
            GeometryReader{
                geo in
                Image ("градиент")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width,
                           height: geo.size.height, alignment: .center)
                    .opacity(1.0)
                VStack{
                    
                    HStack{
                        Text("Горы")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(30)
                        
                        Spacer()
                        
                        Text ("\(self.index + 1)/\(self.data.count)")
                            .foregroundColor(.black)
                    }
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .padding()
                    
                    GeometryReader{g in
                        Carousel(data: self.$data, index: self.$index, show: self.$show, size: g.frame(in: .global))
                    }
                    
                    .padding(.bottom,
                             (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 10)
                    
                }
                
                //Cкрытие представления при появлении расширенного представления
                .opacity(self.show ? 0 : 1)
                //Текущий индекс даст текущую карточку
                if #available(iOS 14.0, *) {
                    ExpandView(data: self.$data[self.index], show: self.$show)
                    //Уменьшение представления на фоне
                        .scaleEffect(self.show ? 1 : 0)
                        .frame(width: self.show ? nil : 0 , height: self.show ? nil : 0)
                } else {
                    // Fallback on earlier versions
                }
            }
            .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    
    struct HScrollView: View{
        @Binding var data: [MountainData]
        //Расширение представления
        @Binding var show: Bool
        var size: CGRect
        
        var body: some View{
            HStack(spacing:0){
                
                ForEach(self.data){i in
                    ZStack(alignment: .bottom){
                        
                        Image(i.imageMount)
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(width: self.size.width - 30, height: self.size.height)
                            .cornerRadius(25)
                        //Избегание занимания дополнительного места .fill с помощью .contentShape
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation{
                                    //Открытие расширенного представления при нажатии на изображение
                                    self.show.toggle()
                                }
                            }
                        VStack(alignment: .leading, spacing: 12){
                            Text(i.plce)
                            
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            HStack(spacing:12){
                                
                                Image(systemName: "mappin.circle.fill")
                                    .font(.system(size: 25, weight: .bold))
                                
                                Text(i.cntry)
                                    .foregroundColor(.gray)
                            }
                            
                            Text(i.detailss)
                            
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
    
    struct Carousel: UIViewRepresentable {
        
        
        func makeCoordinator() -> Coordinator {
            return Carousel.Coordinator(parent1: self)
        }
        
        
        @Binding var data: [MountainData]
        @Binding var index: Int
        @Binding var show: Bool
        var size:  CGRect
        
        func makeUIView(context: Context) -> UIScrollView{
            let view = UIScrollView()
            //Каждая задача просмотра имеет полную ширину, поэтому размер содержимого будет * total count
            view.contentSize = CGSize(width: size.width * CGFloat(data.count), height: size.height)
            
            let child = UIHostingController(rootView: HScrollView(data: self.$data, show: self.$show, size: self.size))
            child.view.backgroundColor = .clear
            child.view.frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
            
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
                
                uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
            }
            
            uiView.contentSize = CGSize(width: size.width * CGFloat(data.count), height: size.height)
        }
        
        class Coordinator: NSObject, UIScrollViewDelegate{
            var parent: Carousel
            
            init(parent1: Carousel){
                
                parent = parent1
            }
            
            
            func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
                let index = Int(scrollView.contentOffset.x/UIScreen.main.bounds.width)
                
                parent.index = index
            }
        }
    }
    
    
    @available(iOS 14.0, *)
    struct ExpandView: View{
        @Environment(\.openURL) var openURL2
        @Binding var data: MountainData
        @Binding var show: Bool
        
        var body: some View{
            VStack{
                
                //Кнопка закрытия
                
                ZStack(alignment:.bottomTrailing){
                    Image(self.data.imageMount)
                        .resizable()
                        .cornerRadius(25)
                    
                    Image(self.data.imageMount)
                        .resizable()
                        .cornerRadius(25)
                    
                    Button {
                        print("dad")
                        withAnimation{
                            self.show.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                            .frame( alignment: .top)
                    }
                            .padding(.trailing)
                        .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 235)
                    
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
                    
                    Text(self.data.plce)
                    
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    HStack(spacing:12){
                        
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 25, weight: .bold))
                        
                        Text(self.data.cntry)
                            .foregroundColor(.gray)
                    }
                    
                    Text(self.data.detailss)
                    
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
                
                Button(action:{openURL2(URL(string: "https://clck.ru/EsF2i")!)
                    
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
class Hosts : UIHostingController<Mountain>{
    override var prefersHomeIndicatorAutoHidden: Bool{
        return true
    }
}


