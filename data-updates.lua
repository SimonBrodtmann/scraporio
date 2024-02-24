for _, resource in pairs(data.raw.resource) do
    if resource.name ~= "scrap" then
        resource.autoplace = nil
        if data.raw["autoplace-control"][resource.name] then
            data.raw["autoplace-control"][resource.name] = nil
        end
    end
end

for key, value in pairs(data.raw["map-gen-presets"].default) do
    if key ~= "default" and type(value) == "table" then
        data.raw["map-gen-presets"].default[key] = nil
    end
end

local factory = data.raw.furnace["reverse-factory-1"]
factory.energy_source = {
    type = "burner",
    fuel_categories = { "chemical" },
    effectivity = 1,
    fuel_inventory_size = 1,
    emissions_per_minute = 4,
    light_flicker = {
        minimum_light_size = 1,
        light_intensity_to_size_coefficient = 0.2,
        color = { 1, 0.6, 0 },
        minimum_intensity = 0.05,
        maximum_intensity = 0.2
    },
    smoke = {
        {
            name = "smoke",
            deviation = { 0.1, 0.1 },
            position = { 0.5, -1.5 },
            frequency = 3
        }
    }
}
table.insert(factory.crafting_categories, "recycle-intermediates")
table.insert(factory.crafting_categories, "recycle-productivity")
table.insert(data.raw.furnace["reverse-factory-2"].crafting_categories, "recycle-productivity")
table.insert(data.raw.furnace["reverse-factory-3"].crafting_categories, "recycle-productivity")

data.raw.technology["reverse-factory-1"] = nil
data.raw.technology["reverse-factory-2"].prerequisites[1] = nil

data.raw.recipe["reverse-factory-1"].enabled = true

local resource = data.raw.resource["scrap"]
resource.minable.hardness = 1
resource.minable.results = {
    { amount = 1, probability = 0.001, name = "nuclear-fuel", },
    { amount = 1, probability = 0.005, name = "solar-panel", },
    { amount = 1, probability = 0.005, name = "accumulator", },
    { amount = 1, probability = 0.01, name = "uranium-238", },
    { amount = 1, probability = 0.02, name = "processing-unit", },
    { amount = 1, probability = 0.025, name = "flying-robot-frame", },
    { amount = 1, probability = 0.04, name = "low-density-structure", },
    { amount = 1, probability = 0.04, name = "heat-pipe", },
    { amount = 1, probability = 0.05, name = "advanced-circuit", },
    { amount = 1, probability = 0.15, name = "stone", },
    { amount = 1, probability = 0.10, name = "solid-fuel", },
    { amount = 1, probability = 0.1, name = "crude-oil-barrel", },
    { amount = 1, probability = 0.1, name = "coal", },
    { amount = 1, probability = 0.2, name = "iron-gear-wheel", },
    { amount = 1, probability = 0.2, name = "steel-plate", },
}