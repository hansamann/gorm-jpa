<%@ page import="hansa.ReTweet" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>ReTweet List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New ReTweet</g:link></span>
        </div>
        <div class="body">
            <h1>ReTweet List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="added" title="Added" />
                        
                   	        <g:sortableColumn property="message" title="Message" />
                        
                   	        <th>Tweet</th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${reTweetInstanceList}" status="i" var="reTweetInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${reTweetInstance.id}">${fieldValue(bean:reTweetInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:reTweetInstance, field:'added')}</td>
                        
                            <td>${fieldValue(bean:reTweetInstance, field:'message')}</td>
                        
                            <td>${fieldValue(bean:reTweetInstance, field:'tweet')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${reTweetInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
