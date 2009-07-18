package hansa



import javax.persistence.*;
// import com.google.appengine.api.datastore.Key;

@Entity
class Tweet implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id

    Date added
    String message

    @OneToMany(mappedBy="tweet")
    List<ReTweet> retweets

    static constraints = {
    	id visible:false
	}
}
