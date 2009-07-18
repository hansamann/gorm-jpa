package hansa



import javax.persistence.*;
// import com.google.appengine.api.datastore.Key;

@Entity
class ReTweet implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id

    Date added
    String message

    @ManyToOne
    Tweet tweet

    static constraints = {
    	id visible:false
	}
}
