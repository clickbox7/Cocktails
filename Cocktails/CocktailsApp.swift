import SwiftUI

@main
struct CocktailsApp: App {

    @StateObject var appRouter: AppRouter = AppRouter()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appRouter.stack) {
                appRouter
                    .rootView()
                    .navigationDestination(for: Route.self, destination: { route in
                        appRouter.destination(for: route)
                    })
            }
        }
        .environmentObject(appRouter)
    }

}
