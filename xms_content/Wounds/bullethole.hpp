class BulletHole : Base // Test wound
{
    scope = public;
    class Infliction
    {
        class HitDetection
        {
            enabled = true;
        };
    };
    
    class Bleeding
    {
        enabled = true;
        woundHealth = 60;
        healingRatePerSecond = 1;
        chance = 1;
    };

    class Pain
    {
        enabled = true;
        basePain = 120;
        painPerSecond = -1;
    };
};