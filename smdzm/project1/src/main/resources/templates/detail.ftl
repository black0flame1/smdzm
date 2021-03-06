<#include "header.ftl">
<div id="main">
    <div class="container">
        <div class="post detail">

            <div class="votebar">
                <#if like gt 0>
                <button class="click-like up pressed" data-id="${news.id}" title="赞同"><i class="vote-arrow"></i><span class="count">${news.likeCount!}</span></button>
                <#else>
                <button class="click-like up" data-id="${news.id}" title="赞同"><i class="vote-arrow"></i><span class="count">${news.likeCount!}</span></button>
                </#if>
                <#if like gt 0>
                <button class="click-dislike down pressed" data-id="${news.id}" title="反对"><i class="vote-arrow"></i></button>
                <#else>
                <button class="click-dislike down" data-id="${news.id}" title="反对"><i class="vote-arrow"></i></button>
                </#if>
            </div>

            <div class="content">
                <div class="content-img">
                    <img src="${news.image!}" alt="">
                </div>
                <div class="content-main">
                    <h3 class="title">
                        <a target="_blank" rel="external nofollow" href="${news.link!}">${news.title!}</a>
                    </h3>
                    <div class="meta">
                        <a target="_blank" rel="external nofollow" href="${news.link!}">${news.link!}</a>
                              <span>
                                  <i class="fa icon-comment"></i> ${news.commentCount!}
                              </span>
                    </div>
                </div>
            </div>
            <div class="user-info">
                <div class="user-avatar">
                    <a href="${contextPath}/user/${owner.id!}"><img width="32" class="img-circle" src="${owner.headUrl!}"></a>
                </div>
                <!--
                <div class="info">
                    <h5>分享者</h5>

                    <a href="http://nowcoder.com/u/125701"><img width="48" class="img-circle" src="http://images.nowcoder.com/images/20141231/622873_1420036789276_622873_1420036771761_%E8%98%91%E8%8F%87.jpg@0e_200w_200h_0c_1i_1o_90Q_1x" alt="Thumb"></a>

                    <h4 class="m-b-xs">影浅</h4>
                    <a class="btn btn-default btn-xs" href="http://nowcoder.com/signin"><i class="fa icon-eye"></i> 关注TA</a>
                </div>
                -->
            </div>

            <div class="subject-name">来自 <a href="${contextPath}/user/${owner.id}">${owner.name!}</a></div>
        </div>


        <div class="post-comment-form">
            <#if user??>
            <span>评论 (${news.commentCount!})</span>
            <form method="post" action="${contextPath}/addComment">
                <input name="newsId" type="hidden" value="${news.id}">

                <div class="form-group text required comment_content">
                    <label class="text required sr-only">
                        <abbr title="required">*</abbr> 评论</label>
                    <textarea rows="5" class="text required comment-content form-control" name="content" id="content"></textarea>
                </div>
                <div class="text-right">
                    <input type="submit" name="commit" value="提 交" class="btn btn-default btn-info">
                </div>
            </form>
            <#else>
            <div class="login-actions">
                <a class="btn btn-success" href="${contextPath}/?pop=1">登录后评论</a>
            </div>
            </#if>
        </div>

        <div id="comments" class="comments">
            <#list  comments as commentvo >
            <div class="media">
                <a class="media-left" href="${contextPath}/user/${commentvo.user.id!}">
                    <img src="${commentvo.user.headUrl!}">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <small class="date">${commentvo.comment.createdDate?string('yyyy-MM-dd HH:mm:ss')}
                        </small>
                    </h4>
                    <div>${commentvo.comment.content!}</div>
                </div>
            </div>
            </#list>
        </div>

    </div>
    <script type="text/javascript">
          $(function(){

            // If really is weixin
            $(document).on('WeixinJSBridgeReady', function() {

              $('.weixin-qrcode-dropdown').show();

              var options = {
                "img_url": "",
                "link": "http://nowcoder.com/j/wt2rwy",
                "desc": "",
                "title": "读《Web 全栈工程师的自我修养》"
              };

              WeixinJSBridge.on('menu:share:appmessage', function (argv){
                WeixinJSBridge.invoke('sendAppMessage', options, function (res) {
                  // _report('send_msg', res.err_msg)
                });
              });

              WeixinJSBridge.on('menu:share:timeline', function (argv) {
                WeixinJSBridge.invoke('shareTimeline', options, function (res) {
                  // _report('send_msg', res.err_msg)
                });
              });

              // $(window).on('touchmove scroll', function() {
              //   if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
              //     $('div.backdrop').show();
              //     $('div.share-help').show();
              //   } else {
              //     $('div.backdrop').hide();
              //     $('div.share-help').hide();
              //   }
              // });

            });

          })

    </script>
    <script type="text/javascript" src="${contextPath}/scripts/main/site/detail.js"></script>
</div>
<#include "footer.ftl">
