
import com.amazonaws.AmazonClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.ClasspathPropertiesFileCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.services.s3.transfer.TransferManager;
import java.util.ArrayList;

public class awsInit {

    public static AWSCredentials credentials;
    public static TransferManager tx;
    public static AmazonS3 s3;

    public static void main(String s[]) {
        listObjs();
    }

    public static TransferManager initS3() {

        s3 = new AmazonS3Client(credentials = new ClasspathPropertiesFileCredentialsProvider().getCredentials());
        //Region usWest2 = Region.getRegion(Regions.US_WEST_2);
        //s3.setRegion(usWest2);
        tx = new TransferManager(s3);
        return tx;
    }

    public static boolean createS3Bucket(String bucketName) {
        try {
            if (tx.getAmazonS3Client().doesBucketExist(bucketName) == false) {
                tx.getAmazonS3Client().createBucket(bucketName);
                return true;
            }
        } catch (AmazonClientException ace) {
            ace.printStackTrace();
            return false;
        }
        return false;
    }

    public static ArrayList<String> listObjs() {
        ArrayList<String> url = new ArrayList<String>();
        initS3();
        System.out.println("Listing buckets");
        for (Bucket bucket : s3.listBuckets()) {
            System.out.println(" - " + bucket.getName());
            System.out.println("Listing objects");
            ObjectListing objectListing = s3.listObjects(bucket.getName());

            for (S3ObjectSummary objectSummary : objectListing.getObjectSummaries()) {
                String key = objectSummary.getKey();
                System.out.println(">> " + key);
                if (key.endsWith("mp4")) {
                    //https://s3-us-west-2.amazonaws.com/itm455/ELB_09_25_2013.mp4
                    String pubLink = "https://s3-us-west-2.amazonaws.com/"+bucket.getName()+"/"+key;
                    url.add(pubLink);
                }
            }
            System.out.println();
        }
        return url;
    }
}
