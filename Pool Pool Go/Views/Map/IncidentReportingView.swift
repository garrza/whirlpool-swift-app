import SwiftUI

struct IncidentReportingView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    @Environment(\.presentationMode) var presentationMode
    @State private var incidentDescription: String = ""
    @State private var incidentImage: UIImage? = nil
    @State private var showSuccessAlert = false
    @State private var isShowingImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary

    var body: some View {
        ScrollView {
            MapView(coordinate: location.coordinates)
                .frame(height: 240)
            CircleImage(image: Image(location.imageName))
                .offset(y: -240)
                .padding(.bottom, -240)
            VStack {
                Text("Generar reporte")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                HStack {
                    Text(location.name + ", " + location.cityName)
                        .font(.title3)
                }
                Divider()

                Button(action: { self.isShowingImagePicker = true }) {
                    VStack {
                        if let incidentImage = incidentImage {
                            Image(uiImage: incidentImage)
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                        } else {
                            Image("fridge-model")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                        }
                        Text(incidentImage == nil ? "Agregar Imagen" : "Cambiar Imagen")
                    }
                }

                TextField("Ingresa descripción de anomalía", text: $incidentDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Spacer()

                Button(action: { submitReport() }) {
                    Text("Subir reporte")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding()
                }
                .foregroundColor(.white)
                .background(.accent)
                .cornerRadius(10)
                .padding()
            }
            .padding()
            .alert(isPresented: $showSuccessAlert) {
                Alert(title: Text("Éxito"),
                      message: Text("Anomalidad reportada con éxito."),
                      dismissButton: .default(Text("OK"), action: {
                        presentationMode.wrappedValue.dismiss()
                      }))
            }
            .sheet(isPresented: $isShowingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$incidentImage, sourceType: self.$sourceType)
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
    }

    func loadImage() {
        // Add any additional logic for loading the selected image
    }

    func submitReport() {
        // Implement the logic to send the incident report (description and image) to your backend server
        // For example, using an API client or networking library

        // After successful submission, show the success alert
        showSuccessAlert = true
    }

    struct ImagePicker: UIViewControllerRepresentable {
        @Binding var image: UIImage?
        @Binding var sourceType: UIImagePickerController.SourceType

        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = sourceType
            return imagePicker
        }

        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
            uiViewController.delegate = context.coordinator
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            let parent: ImagePicker

            init(_ parent: ImagePicker) {
                self.parent = parent
            }

            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
                if let image = info[.originalImage] as? UIImage {
                    parent.image = image.fixedOrientation()
                }

                picker.dismiss(animated: true)
            }
        }
    }
}

extension UIImage {
    func fixedOrientation() -> UIImage {
        if self.imageOrientation == .up {
            return self
        }

        var transform = CGAffineTransform.identity

        switch self.imageOrientation {
        case .down, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: self.size.height)
            transform = transform.rotated(by: .pi)
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.rotated(by: .pi / 2)
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0, y: self.size.height)
            transform = transform.rotated(by: -.pi / 2)
        default:
            break
        }

        switch self.imageOrientation {
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: self.size.width, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: self.size.height, y: 0)
            transform = transform.scaledBy(x: -1, y: 1)
        default:
            break
        }

        let ctx = CGContext(data: nil, width: Int(self.size.width), height: Int(self.size.height), bitsPerComponent: self.cgImage!.bitsPerComponent, bytesPerRow: 0, space: self.cgImage!.colorSpace!, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        ctx?.concatenate(transform)

        switch self.imageOrientation {
        case .left, .leftMirrored:
            ctx?.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.height, height: self.size.width))
        default:
            ctx?.draw(self.cgImage!, in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        }

        let cgImage = ctx?.makeImage()
        return UIImage(cgImage: cgImage!) ?? self
    }
}

#Preview {
    IncidentReportingView(location: LocationsDataService.locations.first!)
}
