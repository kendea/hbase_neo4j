package org.apache.hadoop.examples;

import java.io.IOException;
import java.util.Iterator;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapred.FileInputFormat;
import org.apache.hadoop.mapred.FileOutputFormat;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobConf;
import org.apache.hadoop.mapred.MapReduceBase;
import org.apache.hadoop.mapred.Mapper;
import org.apache.hadoop.mapred.OutputCollector;
import org.apache.hadoop.mapred.Reducer;
import org.apache.hadoop.mapred.Reporter;
import org.apache.hadoop.util.GenericOptionsParser;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

/*
 *
 * To run: bin/hadoop jar ~/pro.jar org.apache.hadoop.examples.extract_for_queries genres_to_movies genres_list movies_test year_list title_to_ids titles_list actors_name_ids person_list words_titles_list  words_person_list 
 */
public class extract_for_queries extends Configured implements Tool {


	
  public static class MapClass extends MapReduceBase
    implements Mapper<LongWritable, Text, Text, Text> {

	 	  
	  //private final static IntWritable one = new IntWritable(1);
	  private Text movie = new Text(); 
	  private Text genre = new Text(); 
	  public void map(LongWritable key, Text value,
                    OutputCollector<Text, Text> output,
                    Reporter reporter) throws IOException {
      
		  String[] itr = value.toString().split("\\|") ;
		  
		  if(itr.length>1 && !itr[1].equals("")){
		  movie.set("1");
		  genre.set(itr[1]);
		  //System.out.println(text1.toString()+"==="+text2.toString());
		  output.collect(genre, movie);
		  }
	  } //end of map
  }// end of MapClass

  /*
   * Reduce Class of the 1st job
   */
  public static class Reduce extends MapReduceBase
    implements Reducer<Text, Text, Text, Text> {
	  private Text vo = new Text();
	  public void reduce(Text key, Iterator<Text> values,
                       OutputCollector<Text, Text> output,
                       Reporter reporter) throws IOException {
    	
		  vo.set("");
		output.collect(key, null);
	  }//end of reduce
  }//end of Reduce class
  
 
  public static class MapClass2 extends MapReduceBase
  implements Mapper<LongWritable, Text, Text, Text> {

	 	  
	  //private final static IntWritable one = new IntWritable(1);
	  private Text year = new Text(); 
	  private Text nv = new Text(); 
	  public void map(LongWritable key, Text value,
                  OutputCollector<Text, Text> output,
                  Reporter reporter) throws IOException {
    
		  String details = value.toString();
		  String yea="";
			String[] itr1 = details.split("\\t",2) ;
			String[] itr2 = itr1[1].split("\\|",7) ;
			if(itr2.length==7){
				yea=itr2[1];
			}
		  
		  if(!itr1[1].equals("")){
			  nv.set("1");
			  year.set(yea);
			  output.collect(year,nv);
		  }
	  } //end of map
}// end of MapClass

/*
 * Reduce Class of the 1st job
 */
public static class Reduce2 extends MapReduceBase
  implements Reducer<Text, Text, Text, Text> {
	private Text ov = new Text();
	  public void reduce(Text key, Iterator<Text> values,
                     OutputCollector<Text, Text> output,
                     Reporter reporter) throws IOException {
  	
		  ov.set("");
		output.collect(key, ov);
	  }//end of reduce
}//end of Reduce class


public static class MapClass3 extends MapReduceBase
implements Mapper<LongWritable, Text, Text, Text> {

	 	  
	  //private final static IntWritable one = new IntWritable(1);
	  private Text movie = new Text(); 
	  private Text nm = new Text(); 
	  public void map(LongWritable key, Text value,
                OutputCollector<Text, Text> output,
                Reporter reporter) throws IOException {
  
		  String[] itr = value.toString().split("\\t") ;
		  if(itr.length>1 && !itr[1].equals("")){
		  movie.set(itr[0]);
		  nm.set("1");
		  //System.out.println(text1.toString()+"==="+text2.toString());
		  output.collect(movie, nm);
		  }
	  } //end of map
}// end of MapClass

/*
* Reduce Class of the 1st job
*/
public static class Reduce3 extends MapReduceBase
implements Reducer<Text, Text, Text, Text> {
	private Text vo = new Text();
	  public void reduce(Text key, Iterator<Text> values,
                   OutputCollector<Text, Text> output,
                   Reporter reporter) throws IOException {
	
		  vo.set("");
		output.collect(key, vo);
	  }//end of reduce
}//end of Reduce class


public static class MapClass4 extends MapReduceBase
implements Mapper<LongWritable, Text, Text, Text> {

	 	  
	  //private final static IntWritable one = new IntWritable(1);
	  private Text word = new Text(); 
	  private Text nm = new Text(); 
	  public void map(LongWritable key, Text value,
                OutputCollector<Text, Text> output,
                Reporter reporter) throws IOException {
  
		  String details = value.toString();
			String[] itr1 = details.split("\\t",2) ;
			String[] itr2 = itr1[0].split(" ") ;
			for (int i=0; i<itr2.length; i++)
			  if(!itr1[1].equals("")){
				  word.set(itr2[i]);
				  nm.set("1");
				  //System.out.println(text1.toString()+"==="+text2.toString());
				  output.collect(word, nm);
			  }
	  } //end of map
}// end of MapClass

/*
* Reduce Class of the 1st job
*/
public static class Reduce4 extends MapReduceBase
implements Reducer<Text, Text, Text, Text> {
	private Text vo = new Text();
	  public void reduce(Text key, Iterator<Text> values,
                   OutputCollector<Text, Text> output,
                   Reporter reporter) throws IOException {
	
		  vo.set("");
		output.collect(key, vo);
	  }//end of reduce
}//end of Reduce class


  /**
   * The main driver 
   */
  public int run(String[] args) throws Exception {
	  
	//1st job configuration  
    JobConf conf = new JobConf(getConf(), extract_for_queries.class);
    conf.setJobName("genres list");

    conf.setOutputKeyClass(Text.class);
    conf.setOutputValueClass(Text.class);
    conf.setMapperClass(MapClass.class);
    conf.setReducerClass(Reduce.class);
	
    String[] otherArgs = new GenericOptionsParser(conf, args).getRemainingArgs();

    FileInputFormat.setInputPaths(conf, otherArgs[0]);   
    FileOutputFormat.setOutputPath(conf, new Path(otherArgs[1]));

    JobClient.runJob(conf);
    
    
    JobConf conf2 = new JobConf(getConf(), extract_for_queries.class);
    conf2.setJobName("years list");

    conf2.setOutputKeyClass(Text.class);
    conf2.setOutputValueClass(Text.class);
    conf2.setMapperClass(MapClass2.class);
    conf2.setReducerClass(Reduce2.class);
    FileInputFormat.setInputPaths(conf2, otherArgs[2]);   
    FileOutputFormat.setOutputPath(conf2, new Path(otherArgs[3]));

    JobClient.runJob(conf2);
    
    
    JobConf conf3 = new JobConf(getConf(), extract_for_queries.class);
    conf3.setJobName("titles list");

    conf3.setOutputKeyClass(Text.class);
    conf3.setOutputValueClass(Text.class);
    conf3.setMapperClass(MapClass3.class);
    conf3.setReducerClass(Reduce3.class);
    FileInputFormat.setInputPaths(conf3, otherArgs[4]);   
    FileOutputFormat.setOutputPath(conf3, new Path(otherArgs[5]));

    JobClient.runJob(conf3);
    
    
    JobConf conf4 = new JobConf(getConf(), extract_for_queries.class);
    conf4.setJobName("person list");

    conf4.setOutputKeyClass(Text.class);
    conf4.setOutputValueClass(Text.class);
    conf4.setMapperClass(MapClass3.class);
    conf4.setReducerClass(Reduce3.class);
    FileInputFormat.setInputPaths(conf4, otherArgs[6]);   
    FileOutputFormat.setOutputPath(conf4, new Path(otherArgs[7]));

    JobClient.runJob(conf4);
    
    
    
    JobConf conf5 = new JobConf(getConf(), extract_for_queries.class);
    conf5.setJobName("titles word list");

    conf5.setOutputKeyClass(Text.class);
    conf5.setOutputValueClass(Text.class);
    conf5.setMapperClass(MapClass4.class);
    conf5.setReducerClass(Reduce4.class);
    FileInputFormat.setInputPaths(conf5, otherArgs[4]);   
    FileOutputFormat.setOutputPath(conf5, new Path(otherArgs[8]));

    JobClient.runJob(conf5);
    
    JobConf conf6 = new JobConf(getConf(), extract_for_queries.class);
    conf6.setJobName("person word list");

    conf6.setOutputKeyClass(Text.class);
    conf6.setOutputValueClass(Text.class);
    conf6.setMapperClass(MapClass4.class);
    conf6.setReducerClass(Reduce4.class);
    FileInputFormat.setInputPaths(conf6, otherArgs[6]);   
    FileOutputFormat.setOutputPath(conf6, new Path(otherArgs[9]));

    JobClient.runJob(conf6);
    
    return 0;
  } //end of run


  public static void main(String[] args) throws Exception {
    int res = ToolRunner.run(new Configuration(), new extract_for_queries(), args);
    System.out.println("***********************************************");
    System.out.println("*********************FINISHED******************");
    System.out.println("***********************************************");
    System.exit(res);
  }

} //end of AolCount Class
