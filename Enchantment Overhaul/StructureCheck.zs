import crafttweaker.api.util.BlockPos;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.entity.MCEntity;
import crafttweaker.api.entity.MCItemEntity;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.world.MCWorld;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.ListData;
import crafttweaker.api.data.ICollectionData;
import crafttweaker.api.server.MCServer;
import crafttweaker.api.BracketHandlers;
import stdlib.List;


public class structureCheck {
    public static cleanserCheck(pos as BlockPos, world as MCWorld, item as MCEntity) as bool{
        var north = world.getBlockState(item.position.north()) == <blockstate:minecraft:quartz_block>;
        var south = world.getBlockState(item.position.south()) == <blockstate:minecraft:quartz_block>;
        var east = world.getBlockState(item.position.east()) == <blockstate:minecraft:quartz_block>;
        var west = world.getBlockState(item.position.west()) == <blockstate:minecraft:quartz_block>;
        var down = world.getBlockState(item.position.down()) == <blockstate:minecraft:glowstone>;
        var inside = world.getBlockState(item.position) == <blockstate:minecraft:water:level=0>;
        if  north & south & east & west & down & inside {
            return true;
        } else {
            return false;
        }
    }

    public static infusionAltarCheck(pos as BlockPos, world as MCWorld) as bool {
        var server = world.asServerWorld().server as MCServer;
        var matrix = world.getBlockState(pos).block == <block:minecraft:lodestone>;
        var centerPedestal = world.getBlockState(pos.down(2)).block == <block:supplementaries:pedestal>;
        var neCorner = world.getBlockState(pos.down(2).north(1).east(1)).block == <block:minecraft:chiseled_polished_blackstone> && world.getBlockState(pos.down(1).north(1).east(1)).block == <block:minecraft:polished_blackstone>;
        var nwCorner = world.getBlockState(pos.down(2).north(1).west(1)).block == <block:minecraft:chiseled_polished_blackstone> && world.getBlockState(pos.down(1).north(1).west(1)).block == <block:minecraft:polished_blackstone>;
        var seCorner = world.getBlockState(pos.down(2).south(1).east(1)).block == <block:minecraft:chiseled_polished_blackstone> && world.getBlockState(pos.down(1).south(1).east(1)).block == <block:minecraft:polished_blackstone>;
        var swCorner = world.getBlockState(pos.down(2).south(1).west(1)).block == <block:minecraft:chiseled_polished_blackstone> && world.getBlockState(pos.down(1).south(1).west(1)).block == <block:minecraft:polished_blackstone>;
        var northPedestal = world.getBlockState(pos.down(2).north(4)).block == <block:supplementaries:pedestal>;
        var southPedestal = world.getBlockState(pos.down(2).south(4)).block == <block:supplementaries:pedestal>;
        var eastPedestal = world.getBlockState(pos.down(2).east(4)).block == <block:supplementaries:pedestal>;
        var westPedestal = world.getBlockState(pos.down(2).west(4)).block == <block:supplementaries:pedestal>;
        if matrix && centerPedestal && neCorner && nwCorner && seCorner && swCorner && northPedestal && southPedestal && eastPedestal && westPedestal {
            server.executeCommand("execute in " + world.dimension +" run particle minecraft:enchant " + globals.positionCommand(pos) + " 0.5 0.5 0.5 0 100 normal", true);
            server.executeCommand("execute in " + world.dimension +" run particle minecraft:enchant " + globals.positionCommand(pos.down(1).north(1).east(1)) + " 0.5 0.5 0.5 0 100 normal", true);
            server.executeCommand("execute in " + world.dimension +" run particle minecraft:enchant " + globals.positionCommand(pos.down(1).north(1).west(1)) + " 0.5 0.5 0.5 0 100 normal", true);
            server.executeCommand("execute in " + world.dimension +" run particle minecraft:enchant " + globals.positionCommand(pos.down(1).south(1).east(1)) + " 0.5 0.5 0.5 0 100 normal", true);
            server.executeCommand("execute in " + world.dimension +" run particle minecraft:enchant " + globals.positionCommand(pos.down(1).south(1).west(1)) + " 0.5 0.5 0.5 0 100 normal", true);
            server.executeCommand("execute positioned " +  globals.positionCommand(pos) + " in " + world.dimension +" run playsound minecraft:block.enchantment_table.use block @a[distance=..5]", true);
            world.setBlockState(pos, <blockstate:contenttweaker:matrix>);
            world.setBlockState(pos.down(1).north(1).east(1), <blockstate:minecraft:air>);
            world.setBlockState(pos.down(1).north(1).west(1), <blockstate:minecraft:air>);
            world.setBlockState(pos.down(1).south(1).east(1), <blockstate:minecraft:air>);
            world.setBlockState(pos.down(1).south(1).west(1), <blockstate:minecraft:air>);
            world.setBlockState(pos.down(2).north(1).east(1), <blockstate:contenttweaker:pillar_sw>);
            world.setBlockState(pos.down(2).north(1).west(1), <blockstate:contenttweaker:pillar_se>);
            world.setBlockState(pos.down(2).south(1).east(1), <blockstate:contenttweaker:pillar_nw>);
            world.setBlockState(pos.down(2).south(1).west(1), <blockstate:contenttweaker:pillar_ne>);
            return true;
        } else {
            return false;
        }
    }

    public static getItemsInPedestals(origin as BlockPos, world as MCWorld) as List<IItemStack>[IItemStack]{
        var center = origin.down(2);
        var blocksInArea = center.getAllInBox(center.north(4).east(4), center.south(4).west(4));
        var items = new List<IItemStack>();
        var catalyst = <item:minecraft:air>;
        for block in blocksInArea {
            //println(block);
            if world.getBlockState(block).block == <block:supplementaries:pedestal> && !(block == center) && world.getBlockState(block).hasTileEntity(){
                if !(world.getTileEntity(block).data as MapData).isEmpty {
                    var pedestal = world.getTileEntity(block).data as MapData;
                    var itemsData = world.getTileData(block) as MapData;
                    var itemArr = pedestal.getAt("Items") as ICollectionData;
                    var item = (itemArr.getAt(0) as MapData).getAt("id").getString() as string;
                    println("item: "+item);
                    items.add(<item:${item}> as IItemStack); 
                }
            } else if world.getBlockState(block).block == <block:supplementaries:pedestal> && block == center && world.getBlockState(block).hasTileEntity(){
                if !(world.getTileEntity(center).data as MapData).isEmpty {
                    var centerPedestal = world.getTileEntity(center).data as MapData;    
                    var centerData = world.getTileData(center) as MapData;
                    var centerArr = centerPedestal.getAt("Items") as ICollectionData;
                    var centerItem = (centerArr.getAt(0) as MapData).getAt("id").getString() as string;
                    println("center: "+centerItem);
                    catalyst = BracketHandlers.getItem(centerItem);
                }
                
            }
        }
        println("catalyst: "+catalyst.displayName);
        var recipe as List<IItemStack>[IItemStack] = {};
        recipe[catalyst] = items;
        return recipe;
    }

    public static spawnItemsInArea(origin as BlockPos, world as MCWorld) as void{
        var center = origin.down(2);
        var blocksInArea = center.getAllInBox(center.north(4).east(4), center.south(4).west(4));
        var items = new List<IItemStack>();
        var catalyst = <item:minecraft:air>;
        for block in blocksInArea {
            //println(block);
            if world.getBlockState(block).block == <block:supplementaries:pedestal> && !(block == center) && world.getBlockState(block).hasTileEntity(){
                if !(world.getTileEntity(block).data as MapData).isEmpty {
                    var pedestal = world.getTileEntity(block).data as MapData;
                    var itemsData = world.getTileData(block) as MapData;
                    var itemArr = pedestal.getAt("Items") as ICollectionData;
                    var item = (itemArr.getAt(0) as MapData).getAt("id").getString() as string;
                    //world.setBlockState(block, <blockstate:minecraft:air>);
                    world.setBlockState(block, <blockstate:supplementaries:pedestal:waterlogged=false,has_item=false,up=false,axis=x,down=false>);
                    println("item: "+item);
                    items.add(<item:${item}> as IItemStack); 
                    world.addEntity(new MCItemEntity(world, block.x, block.y + 0.5, block.z, <item:${item}>));
                }
            }
        }
    }
    /* testing
    function validateStructure(blueprint as MCBlockState[][], corepos as BlockPos, world as MCWorld) as bool {
    //Make sure your structure is padded with air. So it has the same height as width.
        var structureRadius = blueprint[0].length;
        for i in 0 .. (structureRadius - 2) {
            //how to get the appropriate blockstate in the array is the question
            if (world.getBlockState(corepos.south(i)) == blueprint[2+i][1] && world.getBlockState(corepos.south(i).east(i)) == blueprint[2+i][1+i] && world.getBlockState(corepos.south(i).west(i)) == blueprint[2+i][1-i]) {
            
            }
        
        }
    } */
    
}

