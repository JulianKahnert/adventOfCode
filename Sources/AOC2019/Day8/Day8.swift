import Foundation

struct SpaceImageFormat {
    let width: Int
    let height: Int

    private(set) var layers = [[String]]()

    func getLayerWithFewest(_ character: String) -> String {

        let flatLayers = layers.map { $0.joined() }
        let occurenceCounts = flatLayers.map { $0.count(character: character) }

        let sortedLayerCounts = zip(occurenceCounts, flatLayers).sorted { $0.0 < $1.0 }
        return sortedLayerCounts[0].1
    }

    @discardableResult
    mutating func calculateLayers(of input: String) -> [[String]] {

        var layers = [[String]]()

        let layerSize = width * height
        let layerParts = input.split(by: layerSize)
        for layerPart in layerParts {
            layers.append(createLayer(from: layerPart))
        }

        self.layers = layers
        return layers
    }

    private func createLayer(from input: String) -> [String] {
        let layer = input.split(by: width)
        guard layer.count == height else { fatalError() }
        return layer
    }
}
