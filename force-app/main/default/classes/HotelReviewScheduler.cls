global with sharing class HotelReviewScheduler implements Schedulable{
    public HotelReviewScheduler() {

    }

    public void execute(SchedulableContext sc)
    {
     
        // call hotel review batch apex
        HotelReviewBatch obj = new HotelReviewBatch();
        DataBase.executeBatch(obj);
    }
}