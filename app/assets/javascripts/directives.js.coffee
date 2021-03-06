appDirectives = angular.module('appDirectives', [])
appDirectives.directive 'voteSection', () ->
  directive =
  {
    restrict: 'AEC',
    scope: {
      'upVoteCount': '@',
      'downVoteCount': '@',
      'voteStatus': '@',
      'isOwner': '=',
      'imgStyle': '@',
      'voteUp': '&',
      'voteDown': '&'
    },
    link: (scope, element, attrs) ->
      scope['upInactiveImg'] = image_path('up_inactive.png')
      scope['upPressedImg'] = image_path('up_pressed.png')
      scope['downInactiveImg'] = image_path('down_inactive.png')
      scope['downPressedImg'] = image_path('down_pressed.png')
    template: ' <div class="thumb">
                    <div class="pull-left">
                          <div ng-style="{{imgStyle}}">
                            <img ng-click="voteUp()" ng-src="{{voteStatus == \'up\' && upPressedImg || upInactiveImg}}" ng-style="{{imgStyle}}" ng-if="!isOwner">
                          </div>
                    </div>
                    <div class="pull-left" style="margin-left: 10px">
                          <div class="point ng-binding">
                            {{upVoteCount - downVoteCount}}
                          </div>
                    </div>
                    <div class="pull-left" style="margin-left: 10px">
                           <div ng-style="{{imgStyle}}">
                            <img ng-click="voteDown()" ng-src="{{voteStatus == \'down\' && downPressedImg || downInactiveImg}}" ng-style="{{imgStyle}}" ng-if="!isOwner">
                          </div>
                        </div>
                      </div>'
  }

  return directive
