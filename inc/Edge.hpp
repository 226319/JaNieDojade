/*
 * Edge.hpp
 *
 *  Created on: May 31, 2017
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

#ifndef GUI_INC_EDGE_HPP_
#define GUI_INC_EDGE_HPP_
#include "Includes.hpp"
#include "Vertex.hpp"

class Edge {
  std::string src, dst; //source and destination;
  int weight;
public:
  Edge(std::string const &s, std::string const &d, int const &w) :
      src(s), dst(d), weight(w){
  }

  int getWeight()const {
    return weight;
  }

  const std::string  &getSource()const {
    return src;
  }

  const std::string &getDestination()const {
    return dst;
  }

};

#endif /* GUI_INC_EDGE_HPP_ */
