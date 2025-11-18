package map_ecom;

import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.FloatWritable;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Partitioner;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class AverageOrderValuePerMajorCategory {

    public static class OrderMapper extends Mapper<LongWritable, Text, Text, FloatWritable> {
        private Text majorCategory = new Text();
        private FloatWritable orderValue = new FloatWritable();

        public void map(LongWritable key, Text value, Context context)
                throws IOException, InterruptedException {
            String[] fields = value.toString().split(",");
            if (fields.length >= 11) {  // Checking if enough fields
                try {
                    String category = fields[8]; // Major Category (index 8)
                    float orderVal = Float.parseFloat(fields[2]); // OrderValue (index 2)
                    majorCategory.set(category);
                    orderValue.set(orderVal);
                    context.write(majorCategory, orderValue);
                } catch (NumberFormatException e) {
                    // Skip invalid lines (header or bad data)
                }
            }
        }
    }

    public static class AverageReducer extends Reducer<Text, FloatWritable, Text, FloatWritable> {
        public void reduce(Text key, Iterable<FloatWritable> values, Context context)
                throws IOException, InterruptedException {
            float sum = 0;
            int count = 0;
            for (FloatWritable val : values) {
                sum += val.get();
                count++;
            }
            if (count != 0) {
                float average = sum / count;
                context.write(key, new FloatWritable(average));
            }
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "Average Order Value Per Major Category");

        job.setJarByClass(AverageOrderValuePerMajorCategory.class);
        job.setMapperClass(OrderMapper.class);
        job.setReducerClass(AverageReducer.class);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(FloatWritable.class);

        FileInputFormat.addInputPath(job, new Path(args[0])); // Input Path
        FileOutputFormat.setOutputPath(job, new Path(args[1])); // Output Path

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}

