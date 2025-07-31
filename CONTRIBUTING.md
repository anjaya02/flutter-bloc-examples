# Contributing to Flutter BLoC Examples

Thank you for your interest in contributing! This project aims to help developers learn the BLoC pattern through practical examples.

## 🎯 Types of Contributions

We welcome several types of contributions:

### 📚 Examples

- New BLoC pattern implementations
- Additional use cases (authentication, networking, etc.)
- More complex state management scenarios

### 🧪 Testing

- Unit tests for existing BLoCs
- Widget tests for UI components
- Integration tests

### 📖 Documentation

- Code comments and explanations
- README improvements
- Tutorial content

### 🐛 Bug Fixes

- UI overflow issues
- State management bugs
- Performance improvements

## 🚀 Getting Started

1. **Fork the repository**
2. **Clone your fork**
   ```bash
   git clone https://github.com/yourusername/flutter-bloc-examples.git
   ```
3. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Make your changes**
5. **Test your changes**
   ```bash
   flutter test
   flutter run
   ```
6. **Commit your changes**
   ```bash
   git commit -m "Add: your descriptive commit message"
   ```
7. **Push to your fork**
   ```bash
   git push origin feature/your-feature-name
   ```
8. **Create a Pull Request**

## 📝 Code Style Guidelines

### Dart/Flutter

- Follow [Dart style guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Add comprehensive comments for complex logic
- Maintain consistent formatting with `dart format`

### BLoC Pattern

- Keep business logic in BLoC classes, not UI
- Use descriptive event and state names
- Implement proper error handling
- Follow the single responsibility principle

### File Organization

```
lib/
├── bloc/
│   └── feature_name/
│       ├── feature_bloc.dart
│       ├── feature_event.dart
│       ├── feature_state.dart
│       └── feature.dart (barrel file)
├── models/
├── pages/
└── widgets/
```

## 🧪 Testing Guidelines

- Write unit tests for all BLoCs
- Test both success and error scenarios
- Include edge cases
- Maintain good test coverage

Example test structure:

```dart
group('FeatureBloc', () {
  late FeatureBloc bloc;

  setUp(() {
    bloc = FeatureBloc();
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state is correct', () {
    expect(bloc.state, const FeatureInitial());
  });
});
```

## 📋 Pull Request Guidelines

### Before Submitting

- [ ] Code follows style guidelines
- [ ] Tests pass locally
- [ ] New features include tests
- [ ] Documentation is updated
- [ ] No console errors or warnings

### PR Description Template

```markdown
## Description

Brief description of changes

## Type of Change

- [ ] Bug fix
- [ ] New feature
- [ ] Documentation update
- [ ] Performance improvement

## Testing

- [ ] Unit tests added/updated
- [ ] Manual testing completed
- [ ] No breaking changes

## Screenshots (if applicable)

<!-- Add screenshots for UI changes -->
```

## 🎨 UI/UX Guidelines

- Follow Material Design principles
- Ensure responsive design for different screen sizes
- Handle loading states appropriately
- Provide clear error messages
- Maintain consistent spacing and typography

## 💡 Suggesting New Examples

When suggesting new BLoC examples, consider:

1. **Educational Value**: Does it teach new concepts?
2. **Real-world Usage**: Is it practically applicable?
3. **Complexity Level**: Does it fit the beginner to advanced progression?
4. **Documentation**: Can you provide clear explanations?

## 🐛 Reporting Issues

When reporting bugs:

1. **Use a clear title**
2. **Describe expected vs actual behavior**
3. **Provide reproduction steps**
4. **Include environment details** (Flutter version, device, etc.)
5. **Add screenshots if helpful**

## 📞 Questions?

- Open an issue for questions about the codebase
- Start discussions for general BLoC pattern questions
- Check existing issues before creating new ones

## 🙏 Recognition

Contributors will be acknowledged in:

- README.md contributors section
- Release notes for significant contributions
- Special mentions for innovative examples

Thank you for helping make this project better! 🚀
