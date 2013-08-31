%%% @author <Your Name>
%%% @copyright <Your Copyright System>
%%% @doc
-module(foo_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%%===================================================================
%%% Application callbacks
%%%===================================================================

%% @private
start(_StartType, _StartArgs) ->
    case foo_sup:start_link() of
        {ok, Pid} ->
            {ok, Pid};
        Error ->
            Error
                end.

%% @private
stop(_State) ->
    ok.
