local PlacementService = {}
PlacementService.__index = PlacementService

-- Create a placement session
function PlacementService.new(gridSize: number, gridTextureId: number, plot: BasePart?)
    local self = setmetatable({}, PlacementService)

    self.Players = {}
    self.Plot = plot

    self.GridSnap = true
    self.GridSize = gridSize
    self.GridTexture = "rbxassetid://" .. gridTextureId ~= nil and gridTextureId or 0

    self.Bounds = self.Plot ~= nil and true or false
    self.Collisions = true

    return self
end

function PlacementService:AddPlayer(player: Player)
    if table.find(self.Players, player) then warn("[PlacementService] - Player already listed inside of session:", player) return end
    table.insert(self.Players, player)
end

return PlacementService