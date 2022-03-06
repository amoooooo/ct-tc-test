#priority 401

import crafttweaker.api.util.MCVector3d;
import crafttweaker.api.util.BlockPos;
import crafttweaker.api.entity.MCEntity;
import math.Functions;


public class globals {
    public static positionCommand(pos as BlockPos) as string {
        return (pos.x as string) + " " + (pos.y as string) + " " + (pos.z as string);
    }

    public static positionCommand(pos as MCVector3d) as string {
        return (pos.x as string) + " " + (pos.y as string) + " " + (pos.z as string);
    }

    public static diffVector(target as MCVector3d, current as MCVector3d, speed as float) as string {
        var finalpos = globals.vecDivision((target - current), speed);
        return (finalpos.x as string) + " " + (finalpos.y as string) + " " + (finalpos.z as string);
    }

    public static vecDivision(input as MCVector3d, divisor as float) as MCVector3d{
        var output = new MCVector3d(input.x as double / divisor, input.y as double / divisor, input.z as double / divisor);
        return output;
    }
}