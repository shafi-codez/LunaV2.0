package com.iit.aws;

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
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClient;
import com.amazonaws.services.sqs.model.Message;
import com.amazonaws.services.sqs.model.ReceiveMessageRequest;
import com.amazonaws.services.sqs.model.SendMessageRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

public class awsInit {

    public static AWSCredentials credentials;
    public static TransferManager tx;
    public static AmazonS3 s3;

    public static void main(String s[]) {
        //listObjs();
        awsSqs();
        
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
                    String pubLink = "https://s3-us-west-2.amazonaws.com/" + bucket.getName() + "/" + key;
                    url.add(pubLink);
                }
            }
            System.out.println();
        }
        return url;
    }

    public static void awsSqs() {
        AmazonSQS sqs = new AmazonSQSClient(new ClasspathPropertiesFileCredentialsProvider());
        String qUrl = "https://sqs.us-east-1.amazonaws.com/943227140367/requests";
        //sqs.sendMessage(new SendMessageRequest(qUrl, "This is my message text."));

        System.out.println("Receiving messages from MyQueue.\n");
        ReceiveMessageRequest receiveMessageRequest = new ReceiveMessageRequest(qUrl);
        List<Message> messages = sqs.receiveMessage(receiveMessageRequest).getMessages();
        
        for (Message message : messages) {
            System.out.println("  Message");
            System.out.println("    MessageId:     " + message.getMessageId());
            System.out.println("    ReceiptHandle: " + message.getReceiptHandle());
            System.out.println("    MD5OfBody:     " + message.getMD5OfBody());
            System.out.println("    Body:          " + message.getBody());
            for (Entry<String, String> entry : message.getAttributes().entrySet()) {
                System.out.println("  Attribute");
                System.out.println("    Name:  " + entry.getKey());
                System.out.println("    Value: " + entry.getValue());
            }
            //sqs.deleteMessage();
        }
        System.out.println();
    }
}
