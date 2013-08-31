%%% @author <author>
%%% @copyright <copyright>
%%% @doc
-module(foo).

-behaviour(gen_server).

%% API
-export([start_link/0,
         get_value/1,
         add_value/2]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

-define(SERVER, ?MODULE).


%%%===================================================================
%%% API
%%%===================================================================

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

get_value(Name) ->
    gen_server:call(?SERVER, {get, Name}).

add_value(Name, Value) ->
    gen_server:cast(?SERVER, {add, Name, Value}).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%% @private
init([]) ->
    {ok, []}.

%% @private
handle_call({get, Name}, _From, Data) ->
    Reply = proplists:get_value(Name, Data),
    {reply, Reply, Data}.

%% @private
handle_cast({add, Name, Value}, Data) ->
    {noreply, [{Name, Value} | Data]}.

%% @private
handle_info(_Info, State) ->
    {noreply, State}.

%% @private
terminate(_Reason, _State) ->
    ok.

%% @private
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
