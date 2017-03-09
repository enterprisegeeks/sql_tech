package mds;

/** メイン処理です。 
 * 
 * mainメソッドから、SQL発行処理を呼び出すようにしておけば、
 * コマンドラインからの実行ができるよになります。
 */
public class Main {
   
	public static void main(String[] args){
	    
	    // ここに任意の処理を書く。
	    new Sample().doSql();
	}
}

