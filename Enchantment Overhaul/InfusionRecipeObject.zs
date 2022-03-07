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
        if !this.catalyst.matches(input.catalyst) {
          return false;
        }

        if this.fluids.length != input.fluids.length {
            return false;
        }

        if this.inputs.length != input.inputs.length {
            return false;
        }

        var consumedFluids = new List<MCBlockState>();
        for first in this.fluids {
            for second in input.fluids {
                if second in consumedFluids {
                    continue;
                }
                if first == second {
                    consumedFluids.add(second);
                }
            }
        }
        if(consumedFluids.length != input.fluids.length){
            return false;
        }

        var consumedInputs = new List<IItemStack>();

        for first in this.inputs {
            for second in input.inputs {
               if second in consumedInputs {
                    continue;
                }
                if first.matches(second) {
                     consumedInputs.add(second);
                }
            }
        }
        if(consumedInputs.length != input.inputs.length){
            return false;
        }

       return true;
    }

  
}