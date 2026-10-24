// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Course_reposistories.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productReposistories)
final productReposistoriesProvider = ProductReposistoriesProvider._();

final class ProductReposistoriesProvider
    extends
        $FunctionalProvider<
          ProductReposistories,
          ProductReposistories,
          ProductReposistories
        >
    with $Provider<ProductReposistories> {
  ProductReposistoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productReposistoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productReposistoriesHash();

  @$internal
  @override
  $ProviderElement<ProductReposistories> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProductReposistories create(Ref ref) {
    return productReposistories(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductReposistories value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductReposistories>(value),
    );
  }
}

String _$productReposistoriesHash() =>
    r'37b6f9188c6f9351bfeb3596f0d71d4b88bbfd25';
