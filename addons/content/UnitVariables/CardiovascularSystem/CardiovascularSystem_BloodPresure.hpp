class CardiovascularSystem_BloodPresure : Base
{
    // https://www.verywellhealth.com/systolic-and-diastolic-blood-pressure-1746075
    Description = "The blood presure of the unit in mmHg";
    Default = "[120, 80]";                                      // 120 systolic, 80 diastolic
    synchronization = 1;                                        // Delayed by 1 second
};