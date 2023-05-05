//
//  MapLauncher.swift
//  MapLauncherDemo
//
//  Created by Dmytro Romanov on 02.04.2020.
//

import UIKit
import CoreLocation

private enum NavigatorType: CaseIterable {

    // List of supported navigation apps
    case appleMaps
    case googleMaps
    case waze
    case yandexNavi

    // name - supposed to be shown as an action title
    var name: String {
        switch self {
        case .appleMaps:
            return "Apple Maps"
        case .googleMaps:
            return "Google Maps"
        case .waze:
            return "Waze"
        case .yandexNavi:
            return "Yandex"
        }
    }

    // Template should contain two predefined %f attributes for latitude and longitude
    var urlSchemeTemplate: String {
        switch self {
        case .appleMaps:
            return "http://maps.apple.com/?daddr=%f,%f&dirflg=d"
        case .googleMaps:
            return "comgooglemaps://?daddr=%f,%f"
        case .waze:
            return "waze://?ll=%f,%f&navigate=yes"
        case .yandexNavi:
            return "yandexnavi://build_route_on_map?lat_to=%f&lon_to=%f"
        }
    }

    // Prepare url scheme with destination coordinates, 'nil' - if an app is not installed on the current device
    func urlScheme(for coordinate: CLLocationCoordinate2D) -> URL? {
        guard let url = URL(string: String(format: self.urlSchemeTemplate, coordinate.latitude, coordinate.longitude)) else { return nil }
        return UIApplication.shared.canOpenURL(url) ? url : nil
    }
}

private struct NavigatorItem {
    let title: String
    let action: () -> ()
}

private struct Navigator {

    // Destination coordinates, should be provided on initialization
    let destination: CLLocationCoordinate2D

    // Provide a list of NavigatorItem available for the current device (depend on currently installed navigation apps)
    var availableNavigatorTypes: [NavigatorItem] {
        NavigatorType.allCases
            .compactMap {
                guard let url = $0.urlScheme(for: destination) else { return nil }
                return NavigatorItem(title: $0.name) { UIApplication.shared.open(url) }
        }
    }
}

public class MapLauncher {

    private var actionSheetTitle: String?
    private var actionSheetMessage: String?
    private var cancelAtionTitle: String?

    public init() {}

    /// Presenting an action sheet with a list of available navigation apps for provided destination coordinate
    /// - Parameters:
    ///   - destination: desired destination coordinates
    ///   - controller: host UIViewController for an ActionSheet
    ///   - actionSheetTitle: ActionSheet title, default value - nil
    ///   - actionSheetMessage: ActionSheet message, default value - nil
    ///   - cancelAtionTitle: ActionSheet cancel action title, default value - "Cancel"
    public func present(destination: CLLocationCoordinate2D,
                        on controller: UIViewController,
                        actionSheetTitle: String? = nil,
                        actionSheetMessage: String? = nil,
                        cancelAtionTitle: String = "Cancel") {
        self.actionSheetTitle = actionSheetTitle
        self.actionSheetMessage = actionSheetMessage
        self.cancelAtionTitle = cancelAtionTitle
        present(actionSheetController: buildActionSheet(for: destination), on: controller)
    }

    private func buildActionSheet(for destination: CLLocationCoordinate2D) -> UIAlertController {

        let actionSheetController = UIAlertController(title: actionSheetTitle,
                                                      message: actionSheetMessage,
                                                      preferredStyle: .actionSheet)

        // Add avalible navigation actions
        Navigator(destination: destination).availableNavigatorTypes.forEach {
            let navigatoeAction = $0.action
            let action = UIAlertAction(title: $0.title, style: .default) { action -> Void in
                navigatoeAction()
            }
            actionSheetController.addAction(action)
        }

        // Add Cancel action
        actionSheetController.addAction(UIAlertAction(title: cancelAtionTitle, style: .cancel, handler: nil))

        return actionSheetController
    }

    // Internal presentation method to resolve an issue with iPad presentation
    private func present(actionSheetController: UIAlertController, on controller: UIViewController) {

        // Set up iPad popover presentation
        if let presenter = actionSheetController.popoverPresentationController {
            presenter.sourceView = controller.view
            presenter.sourceRect = CGRect(x: controller.view.bounds.midX, y: controller.view.bounds.midY, width: 0, height: 0)
            presenter.permittedArrowDirections = []
        }

        controller.present(actionSheetController, animated: true, completion: nil)
    }
}
