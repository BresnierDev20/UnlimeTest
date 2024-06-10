//
//  TextField.swift
//  UnlimeTest
//
//  Created by Angelbert Castro on 7/6/24.
//

import SwiftUI

struct InputField: View {
  var text: String
  @Binding var value: String
  var description: String
  var isFieldSelected: Bool
  var isSelectd: Bool
  var onTapGesture: () -> Void
  var onTapSelect: () -> Void
  @FocusState var isTextFieldFocused: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: 4) {
      Text(text)
        .customFont(.semiBold, size: 16)
          .foregroundColor(.white)
          .padding(.leading, Constants.paddingLeading)

      TextField("", text: $value)
        .foregroundColor(.black)
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .textFieldStyle(CustomTextFieldStyle(value: $value, selected: isFieldSelected, isTextValid: true,description: description, sizeText: 0))
        .focused($isTextFieldFocused)
        .onTapGesture {
          isTextFieldFocused = true
          onTapGesture()
        }
        .onSubmit {
          onTapSelect()
        }

      if !isSelectd && value.count >= 1 {
        Text("")
          .font(.caption)
          .foregroundColor(.red)
          .padding(.leading, Constants.paddingLeading)
      }
    }.padding(.top,4)
  }
}

struct CustomTextFieldStyle: TextFieldStyle {
  @Binding var value: String
  var selected: Bool
  var isTextValid: Bool
  var description: String
  var sizeText: CGFloat

  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding(.horizontal, 20)
      .padding(.vertical, 20)
      .background(
        RoundedRectangle(cornerRadius: 8)
            .stroke(isTextValid ? Color.black : Color.red, lineWidth: selected ? 2 : 0)
      )
      .styleAsInput($value, placeholder: description, hintColor: .gray, sizeText: sizeText)
      .background(selected ? Color.white : Color.white.opacity(0.8))
      .cornerRadius(8)
  }
}

struct TextInputModifier : ViewModifier {
  @FocusState var focus
  let placeholder: String
  @Binding var text: String
  let hintColor: Color
  let sizeText: CGFloat

  init(_ placeholder: String = "", value: Binding<String> = .constant(""), hintColor: Color = .black, _ size : CGFloat) {
    self.placeholder = placeholder
    self._text = value
    self.hintColor = hintColor
    self.sizeText = size
  }

  func body(content: Content) -> some View {
    ZStack {
      if text.isEmpty && !focus {
        HStack {
          Text(placeholder)
            .customFont(.regular, size: 16)
            .foregroundColor(hintColor)
            .padding(.leading, 20)
          Spacer()
        }
      }
      content
        .focused($focus)
        .customFont(.regular, size: 16)
        .padding(.leading, sizeText)
    }
  }
}

struct InputSecureField: View {
    @Binding var password: String
    var showPassword: Bool
    var isTextValid: Bool
    var isSecurySelected: Bool
    var forgotPassword: Bool
    var title: String
    var description: String
    var txtMessages: String
    var onFieldTapGesture: () -> Void
    var onButtonTapGesture: () -> Void
    var onChange: () -> Void
    var onFieldTapSelect: () -> Void
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        ZStack(alignment: .trailing) {
            VStack(alignment: .leading, spacing: 4)  {
                Text(title)
                    .customFont(.semiBold, size: Constants.sizeSixteen)
                    .foregroundColor(.white)
                    .padding(.leading, 4)
                    .padding(.bottom,-10)
                
                if showPassword {
                    PasswordField(
                        password: $password,
                        showPassword: showPassword,
                        isTextValid: isTextValid,
                        isSecurySelected: isSecurySelected,
                        description: description,
                        onFieldTapGesture: onFieldTapGesture,
                        onButtonTapGesture: onButtonTapGesture,
                        onChange: onChange,
                        onFieldTapSelect: onFieldTapSelect,
                        isTextFieldFocused: _isTextFieldFocused
                    )
                } else {
                    SecurePasswordField(
                        password: $password,
                        showPassword: showPassword,
                        isTextValid: isTextValid,
                        isSecurySelected: isSecurySelected,
                        description: description,
                        onFieldTapGesture: onFieldTapGesture,
                        onButtonTapGesture: onButtonTapGesture,
                        onChange: onChange,
                        onFieldTapSelect: onFieldTapSelect,
                        isTextFieldFocused: _isTextFieldFocused
                    )
                }
                if !isTextValid && password.count >= 1 && forgotPassword {
                    HStack {
                        Text(txtMessages)
                            .font(.caption)
                            .foregroundColor(.red)
                            .padding(.leading, 4)
                        Spacer()
                    }.padding(.vertical, 4)
                }
            }
        }.padding(.top, Constants.paddingTop)
    }
}

struct PasswordField: View {
    @Binding var password: String
    var showPassword: Bool
    var isTextValid: Bool
    var isSecurySelected: Bool
    var description: String
    var onFieldTapGesture: () -> Void
    var onButtonTapGesture: () -> Void
    var onChange: () -> Void
    var onFieldTapSelect: () -> Void
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        TextField("", text: $password)
            .foregroundColor(.black)
            .disableAutocorrection(true)
            .textFieldStyle(CustomTextFieldStyle(value: $password, selected: isSecurySelected, isTextValid: isTextValid, description: description, sizeText: 0))
            .focused($isTextFieldFocused)
            .onTapGesture {
                isTextFieldFocused = true
                onFieldTapGesture()
            }
            .onSubmit {
                onFieldTapSelect()
            }
            .onChange(of: password) { _ in
                onChange()
            }
            .overlay(ShowHidePasswordButton(showPassword: showPassword, onButtonTapGesture: onButtonTapGesture))
            .padding(.top, 12)
    }
}

struct SecurePasswordField: View {
    @Binding var password: String
    var showPassword: Bool
    var isTextValid: Bool
    var isSecurySelected: Bool
    var description: String
    var onFieldTapGesture: () -> Void
    var onButtonTapGesture: () -> Void
    var onChange: () -> Void
    var onFieldTapSelect: () -> Void
    @FocusState var isTextFieldFocused: Bool

    var body: some View {
        SecureField("", text: $password)
            .foregroundColor(.black)
            .disableAutocorrection(true)
            .textFieldStyle(CustomTextFieldStyle(value: $password, selected: isSecurySelected, isTextValid: isTextValid, description: description, sizeText: 0))
            .focused($isTextFieldFocused)
            .onTapGesture {
                isTextFieldFocused = true
                onFieldTapGesture()
            }
            .onSubmit {
                onFieldTapSelect()
            }
            .onChange(of: password) { _ in
                onChange()
            }
            .overlay(ShowHidePasswordButton(showPassword: showPassword, onButtonTapGesture: onButtonTapGesture))
            .padding(.top, 12)
    }
}

struct ShowHidePasswordButton: View {
    var showPassword: Bool
    var onButtonTapGesture: () -> Void
    
    var body: some View {
        Button(action: {
            onButtonTapGesture()
        }) {
            HStack {
                Spacer()
                Image
                    .fromSystem(showPassword ? .eyeSlash : .eyefill)
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 25, height: 20)
                    .scaledToFill()
                    .padding(.trailing, 12)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.top, 8)
    }
}

extension InputField {
  class Constants {
    static let paddingTop: CGFloat = 12
    static let paddingLeading: CGFloat = 4
    static let sizeThirtyEight: CGFloat = 38
    static let sizeEighteen: CGFloat = 18
    static let sizeTwelve: CGFloat = 12
    static let sizeFourteen: CGFloat = 14
  }
}

extension InputSecureField {
  class Constants {
    static let paddingTop: CGFloat = 12
    static let paddingHorizontal: CGFloat = 8
    static let passwordLeading: CGFloat = 20
    static let passwordBottom: CGFloat = 20
    static let sizeSixteen: CGFloat = 16
  }
}

extension View {
  func styleAsInput(_ text: Binding<String>, placeholder: String, hintColor: Color = .white, sizeText: CGFloat ) -> some View {
    modifier(TextInputModifier(placeholder, value: text, hintColor: hintColor, sizeText))
  }
}