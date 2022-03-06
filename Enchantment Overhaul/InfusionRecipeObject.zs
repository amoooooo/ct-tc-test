import crafttweaker.api.player.MCPlayerEntity;
import crafttweaker.api.entity.MCItemEntity;
import stdlib.List;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.util.MCVector3d;
import crafttweaker.api.blocks.MCBlockState;


public class InfusionRecipeObject {
    public var inputs as IItemStack[] : get, set;
    public var catalyst as IItemStack : get, set;
    public var fluids as MCBlockState[] : get, set;


    public this(inputs as IItemStack[], catalyst as IItemStack, fluids as MCBlockState[]) {
        this.inputs = inputs;
        this.catalyst = catalyst;
        this.fluids = fluids;
    }

    public matches(input as InfusionRecipeObject) as bool {
        var input1 = this.inputs.sorted();
        var input2 = input.inputs.sorted();
        var fluids1 = this.fluids.sorted();
        var fluids2 = input.fluids.sorted();
        if input1 == input2 && fluids1 == fluids2 && this.catalyst == input.catalyst {
            return true;
        } else {
            return false;
        }
    }
  
}