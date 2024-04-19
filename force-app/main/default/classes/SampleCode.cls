public class SampleCode {
   public void InsertingRecords(){
        List<Account> acclist = new List<Account>();
        Account acc = new Account();
        acc.Name = 'Balakrishna';
        acc.Type = 'Prospect';
        acc.Industry = 'Banking';
        acc.Phone = '6598785456';
        //acc.CreatedDate =system.Date;
        acclist.add(acc);
        insert acclist;
   //testing webhooks
        System.debug('Account Record is successfully inserted on Account object'+acclist);
   }
}