#loader contenttweaker

import mods.contenttweaker.block.BlockBuilder;
import mods.contenttweaker.block.advance.BlockBuilderAdvanced;
import mods.contenttweaker.block.BlockRenderType;
import mods.contenttweaker.block.BlockTypeBuilder;
import crafttweaker.api.item.ItemGroup;

var pillar = new BlockBuilder(<blockmaterial:earth>);
pillar.withType<BlockBuilderAdvanced>();
pillar.withRenderType(BlockRenderType.CUTOUT);
pillar.build("pillar_ne");