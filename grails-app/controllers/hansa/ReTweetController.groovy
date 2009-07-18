

package hansa

class ReTweetController {
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ reTweetInstanceList: ReTweet.list( params ), reTweetInstanceTotal: ReTweet.count() ]
    }

    def show = {
        def reTweetInstance = ReTweet.get( params.id )

        if(!reTweetInstance) {
            flash.message = "ReTweet not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ reTweetInstance : reTweetInstance ] }
    }

    def delete = {
        def reTweetInstance = ReTweet.get( params.id )
        if(reTweetInstance) {
            try {
                reTweetInstance.delete(flush:true)
                flash.message = "ReTweet ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "ReTweet ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else {
            flash.message = "ReTweet not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = {
        def reTweetInstance = ReTweet.get( params.id )

        if(!reTweetInstance) {
            flash.message = "ReTweet not found with id ${params.id}"
            redirect(action:list)
        }
        else {
            return [ reTweetInstance : reTweetInstance ]
        }
    }

    def update = {
        def reTweetInstance = ReTweet.get( params.id )
        if(reTweetInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(reTweetInstance.version > version) {
                    
                    reTweetInstance.errors.rejectValue("version", "reTweet.optimistic.locking.failure", "Another user has updated this ReTweet while you were editing.")
                    render(view:'edit',model:[reTweetInstance:reTweetInstance])
                    return
                }
            }
            reTweetInstance.properties = params
            if(!reTweetInstance.hasErrors() && reTweetInstance.save()) {
                flash.message = "ReTweet ${params.id} updated"
                redirect(action:show,id:reTweetInstance.id)
            }
            else {
                render(view:'edit',model:[reTweetInstance:reTweetInstance])
            }
        }
        else {
            flash.message = "ReTweet not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = {
        def reTweetInstance = new ReTweet()
        reTweetInstance.properties = params
        return ['reTweetInstance':reTweetInstance]
    }

    def save = {
        def reTweetInstance = new ReTweet(params)
		ReTweet.withTransaction {
	        if(reTweetInstance.save()) {
	            flash.message = "ReTweet ${reTweetInstance.id} created"
	            redirect(action:show,id:reTweetInstance.id)
	        }
	        else {
	            render(view:'create',model:[reTweetInstance:reTweetInstance])
	        }
		}
    }
}
