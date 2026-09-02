import Foundation

#if !SWIFT_PACKAGE
// SPM synthesizes Bundle.module from Package.swift resources. CocoaPods
// does not, so the vendored GhosttyRuntimeResources lookups need this
// shim. The GhosttyTerminal resource bundle holds Resources/Ghostty and
// Resources/terminfo (shell integration + compiled terminfo).
extension Bundle {
  static var module: Bundle {
    let host = Bundle(for: TerminalController.self)
    if let url = host.url(forResource: "GhosttyTerminal", withExtension: "bundle"),
      let bundle = Bundle(url: url)
    {
      return bundle
    }
    return host
  }
}
#endif
