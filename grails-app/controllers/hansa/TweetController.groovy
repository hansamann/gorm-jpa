

package hansa

class TweetController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ tweetInstanceList: Tweet.list( params ), tweetInstanceTotal: Tweet.count() ]
    }

    def show = {
        def tweetInstance = Tweet.get( params.id )

        if(!tweetInstance) {
            flash.message = "Tweet not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ tweetInstance : tweetInstance ] }
    }

    def delete = {
        def tweetInstance = Tweet.get( params.id )
        if(tweetInstance) {
            try {
                tweetInstance.delete(flush:true)
                flash.message = "Tweet ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "Tweet ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "Tweet not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def deleteAll = {
        
    }

    def edit = {
        def tweetInstance = Tweet.get( params.id )

        if(!tweetInstance) {
            flash.message = "Tweet not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ tweetInstance : tweetInstance ]
        }
    }

    def update = {
        def tweetInstance = Tweet.get( params.id )
        if(tweetInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(tweetInstance.version > version) {
                    
                    tweetInstance.errors.rejectValue("version", "tweet.optimistic.locking.failure", "Another user has updated this Tweet while you were editing.")
                    render(view:'edit',model:[tweetInstance:tweetInstance])
                    return
                }
            }
            tweetInstance.properties = params
            if(!tweetInstance.hasErrors() && tweetInstance.save()) {
                flash.message = "Tweet ${params.id} updated"
                redirect(action:show,id:tweetInstance.id)
            }
            else {
                render(view:'edit',model:[tweetInstance:tweetInstance])
            }
        }
        else {
            flash.message = "Tweet not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def tweetInstance = new Tweet()
        tweetInstance.properties = params
        return ['tweetInstance':tweetInstance]
    }

    def save = {
        def tweetInstance = new Tweet(params)
		Tweet.withTransaction {
	        if(tweetInstance.save()) {
	            flash.message = "Tweet ${tweetInstance.id} created"
	            redirect(action:show,id:tweetInstance.id)
	        }
	        else {
	            render(view:'create',model:[tweetInstance:tweetInstance])
	        }
		}
    }
}
