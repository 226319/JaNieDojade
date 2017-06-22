/*
 * Route_finder.hpp
 *
 *  Created on: Jun 19, 2017
 *      Author: 226332
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef GRAPH_INC_ROUTE_MATCHER_HPP_
#define GRAPH_INC_ROUTE_MATCHER_HPP_
#include "Includes.hpp"
#include "Route.hpp"

class Route_matcher {
  std::vector<Route> routes;

public:
  Route_matcher(){
  }
  ;

  void add_Route(Route &&r){ //must add fully filled route!!!!
    routes.push_back(r);
  }

  void add_Routes(std::vector<Route> &&r){ //must add fully filled route!!!!
    routes.insert(routes.end(), r.begin(), r.end());
  }

  const std::vector<Route> &getRoutes() const{
    return routes;
  }

  std::vector<Route> match_route(const std::vector<std::string>& path){
      std::vector<Route> result { };
      std::multimap<size_t, Route> q;

      for (auto i = routes.begin(); i < routes.end(); i++){
        for (auto j = i->getStations().begin(); j < i->getStations().end(); j++){
          Route route(i->getName(), i->getDirection(), i->getType(),
              i->getVariation());
          size_t match = 0;
          if (j->first == *path.begin()){
            for (auto&k : path){
              if (j->first == k){
                match++;
                route.addStop(j->first, j->second);
              }
              if (j < i->getStations().end()){
                j++;
              }
            }
            if (match == path.size()){
              result.push_back(route);
              return result;
            }
            q.insert( { match, *i });
            break;
          }

        }

      }

      auto current_station = path.begin();
      for (size_t i = path.size(); i > 0; i--){
        auto range = q.equal_range(i);
          for (auto j = range.first; j != range.second; j++){
            for (auto k = j->second.getStations().begin();
                k < j->second.getStations().end(); k++){
              if (k->first == *current_station){
                Route route(j->second.getName(), j->second.getDirection(),
                    j->second.getType(), j->second.getVariation());

                while ((k->first == *current_station)){
                  route.addStop(k->first, k->second);
                  k++;
                  //std::cout << *current_station <<" "<<i<< std::endl;
                  if (current_station < path.end() - 1){
                    current_station++;
                  } else{
                    result.push_back(route);
                    return result;
                  }
                }
                if (route.getStations().size() > 1){
                  result.push_back(route);
                  i = path.size();
                } else if (current_station == path.end()){
                  return result;
                }
                if (current_station != path.begin()){
                  current_station--;
                }

                break;
              }
            }
          }
        }

      return result;
    }
  ~Route_matcher(){
  }
  ;

};

#endif /* GRAPH_INC_ROUTE_MATCHER_HPP_ */
