enum LocalStorageKey {
  token,
  cart,
  selectedPrinter,
  printerList,
}

enum Status {
  initial,
  loading,
  success,
  failure,
}

enum CartItemAction {
  increment,
  decrement,
  neutral,
}

/// user capital letter at first in using time
enum CartType {
  online,
  wholesale,
  regular,
}

enum MenuOptions{
  view,
  ledger,
  edit,
  activate,
  deactivate,
  delete,
}

enum WidgetType{
  material,
  cupertino,
}

enum ProductType{
  normal,
  variant,
  model,
}

enum InvoiceType{
  sales,
  purchase,
}
