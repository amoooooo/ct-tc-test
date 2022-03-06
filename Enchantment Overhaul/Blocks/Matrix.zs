#loader contenttweaker

import mods.contenttweaker.block.BlockBuilder;
import mods.contenttweaker.block.advance.BlockBuilderAdvanced;
import mods.contenttweaker.block.BlockRenderType;
import mods.contenttweaker.block.BlockTypeBuilder;
import crafttweaker.api.item.ItemGroup;

var matrix = new BlockBuilder(<blockmaterial:earth>);
matrix.withType<BlockBuilderAdvanced>();
matrix.withRenderType(BlockRenderType.CUTOUT);
matrix.build("matrix");