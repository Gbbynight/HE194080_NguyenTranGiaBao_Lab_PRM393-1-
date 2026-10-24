// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Courseviewmodel1.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductViewModel1)
final productViewModel1Provider = ProductViewModel1Provider._();

final class ProductViewModel1Provider
    extends $AsyncNotifierProvider<ProductViewModel1, List<Product>> {
  ProductViewModel1Provider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productViewModel1Provider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productViewModel1Hash();

  @$internal
  @override
  ProductViewModel1 create() => ProductViewModel1();
}

String _$productViewModel1Hash() => r'82224bc5fe8604ad533c93f9a507df75ef16ae0e';

abstract class _$ProductViewModel1 extends $AsyncNotifier<List<Product>> {
  FutureOr<List<Product>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Product>>, List<Product>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Product>>, List<Product>>,
              AsyncValue<List<Product>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
