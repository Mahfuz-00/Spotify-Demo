import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  /// void UpdateTheme (ThemeMode Theme) {
  ///    emit(Theme);
  /// }
  /// Good Practice Below

  void UpdateTheme(ThemeMode Theme) => emit(Theme);

  @override
  ThemeMode fromJson(Map<String, dynamic> json) {
    // Deserialize the theme mode from the JSON
    return ThemeMode.values[json['themeMode'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    // Serialize the theme mode to JSON
    return {
      'themeMode': state.index,
    };
  }

  /// Original::
  /// @override
  /// fromJson(Map<String, dynamic> json) {
  ///     throw UnimplementedError();
  /// }
  ///
  /// @override
  /// Map<String, dynamic>? toJson(state) {
  ///     throw UnimplementedError();
  /// }
  ///
  ///
  /// Key Differences
  /// Error Handling:
  ///
  /// Original: Throws UnimplementedError, which leads to runtime exceptions when these methods are called.
  /// Suggested: Provides actual implementations that do not throw errors, allowing the HydratedCubit to function correctly.
  /// Functionality:
  ///
  /// Original: No serialization or deserialization logic, making the state management ineffective for persistence.
  /// Suggested: Implements the logic necessary for saving and retrieving the ThemeMode, allowing it to persist across app launches.
  /// State Management:
  ///
  /// Original: State changes are not stored or restored, leading to potential issues where user preferences (like theme) are lost.
  /// Suggested: Properly handles state changes, ensuring that user preferences are preserved even after closing and reopening the app.
}
