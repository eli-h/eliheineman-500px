//
//  PhotoData.swift
//  eliheineman-500px
//
//  Created by eli heineman on 2020-10-06.
//

import Foundation

struct Root: Decodable {
    let current_page: Int
    let total_pages: Int
    let total_items: Int
    let feature: String
    let photos: [Photo]
}

struct Photo: Decodable {
    let id: Int
    let created_at: String
    let privacy: Bool
    let profile: Bool
    let url: String
    let user_id: Int
    let status: Int
    let width: Int
    let height: Int
    let rating: Float
    let highest_rating: Float
    let highest_rating_date: String
    let image_format: String
    let images: [Image]
    let image_url: [String]
    let name: String
    let description: String
    let category: Int
    let taken_at: String?
    let shutter_speed: String
    let focal_length: String
    let aperture: String
    let camera: String
    let lens: String
    let iso: String
    let location: String?
    let latitude: Float?
    let longitude: Float?
    let nsfw: Bool
    let privacy_level: Int
    let watermark: Bool
    let has_nsfw_tags: Bool
    let liked: Bool?
    let voted: Bool?
    let comments_count: Int
    let votes_count: Int
    let positive_votes_count: Int
    let times_viewed: Int
}

struct Image: Decodable {
    let format: String
    let size: Int
    let url: String
    let https_url: String
}
//"photos": [
//  {
//    "id": 1022851263,
//    "created_at": "2020-10-05T21:12:10+00:00",
//    "privacy": false,
//    "profile": true,
//    "url": "/photo/1022851263/-OBLIQUOUS-REFLECTIONS-by-Bruno-Soares",
//    "user_id": 14656405,
//    "status": 1,
//    "width": 5430,
//    "height": 3620,
//    "rating": 99.6,
//    "highest_rating": 99.6,
//    "highest_rating_date": "2020-10-06T20:12:10+00:00",
//    "image_format": "jpg",
//    "images": [
//      {
//        "format": "jpeg",
//        "size": 22,
//        "url": "https://drscdn.500px.org/photo/1022851263/q%3D50_h%3D450/v2?sig=b01e7542806ca6d9364a3d5d9a6eaa440135933a201dc2905e4015e00a89b7e7",
//        "https_url": "https://drscdn.500px.org/photo/1022851263/q%3D50_h%3D450/v2?sig=b01e7542806ca6d9364a3d5d9a6eaa440135933a201dc2905e4015e00a89b7e7"
//      }
//    ],
//    "image_url": [
//      "https://drscdn.500px.org/photo/1022851263/q%3D50_h%3D450/v2?sig=b01e7542806ca6d9364a3d5d9a6eaa440135933a201dc2905e4015e00a89b7e7"
//    ],
//    "name": "|| OBLIQUOUS REFLECTIONS",
//    "description": "",
//    "category": 8,
//    "taken_at": "2019-04-07T11:50:46+00:00",
//    "shutter_speed": "60.0",
//    "focal_length": "10",
//    "aperture": "16",
//    "camera": "FUJIFILM X-T2",
//    "lens": "0",
//    "iso": "200",
//    "location": "Hornafjörður, Austurland, Islândia",
//    "latitude": 64.255615,
//    "longitude": -14.974728333333333,
//    "nsfw": false,
//    "privacy_level": 2,
//    "watermark": false,
//    "has_nsfw_tags": false,
//    "liked": null,
//    "voted": null,
//    "comments_count": 55,
//    "votes_count": 1757,
//    "positive_votes_count": 1757,
//    "times_viewed": 20870,
//    "user": {
//      "id": 14656405,
//      "username": "Brun_0",
//      "fullname": "Bruno Soares",
//      "avatar_version": 3,
//      "registration_date": "2015-10-24T11:15:32+00:00",
//      "avatars": {
//        "tiny": {
//          "https": "https://drscdn.500px.org/user_avatar/14656405/q%3D85_w%3D30_h%3D30/v2?webp=true&v=3&sig=b2f95873165058cb106441df9e28ee1baf8e80650dd185642cb8edb2e8e9f595"
//        },
//        "small": {
//          "https": "https://drscdn.500px.org/user_avatar/14656405/q%3D85_w%3D50_h%3D50/v2?webp=true&v=3&sig=3cd8aefc147392e77b27ef69ff2335e05922a8756cf0e8c1dd073ddb05ed1316"
//        },
//        "large": {
//          "https": "https://drscdn.500px.org/user_avatar/14656405/q%3D85_w%3D100_h%3D100/v2?webp=true&v=3&sig=b5f2d9e2e9b7cfc28647422b55306d299c971472fa1b8845a0a24885069af063"
//        },
//        "default": {
//          "https": "https://drscdn.500px.org/user_avatar/14656405/q%3D85_w%3D300_h%3D300/v2?webp=true&v=3&sig=1a36844c3b83198299d850a2654a8835c7699084ad95623dae44e3588df8fdd5"
//        }
//      },
//      "userpic_url": "https://drscdn.500px.org/user_avatar/14656405/q%3D85_w%3D300_h%3D300/v2?webp=true&v=3&sig=1a36844c3b83198299d850a2654a8835c7699084ad95623dae44e3588df8fdd5",
//      "userpic_https_url": "https://drscdn.500px.org/user_avatar/14656405/q%3D85_w%3D300_h%3D300/v2?webp=true&v=3&sig=1a36844c3b83198299d850a2654a8835c7699084ad95623dae44e3588df8fdd5",
//      "usertype": 0,
//      "active": 1,
//      "firstname": "Bruno",
//      "lastname": "Soares",
//      "about": "Amateur photographer that loves to go out travel and geocaching clicking mostly on:\nlandscape | city and architecture | my dogs\nFujifilm X-T2 + XF10-24mm + XF55-200mm\nNisi filters\nGitzo tripod",
//      "city": "Odivelas",
//      "state": "",
//      "country": "Portugal",
//      "cover_url": "https://drscdn.500px.org/user_cover/14656405/q%3D65_m%3D2048/v2?webp=true&v=13&sig=8130bdfd4823814870b5b6ad360d11c9cb9318bf2e7b3986211aa56745c048d9",
//      "upgrade_status": 3,
//      "affection": 676729,
//      "followers_count": 0,
//      "following": false
//    },
//    "editors_choice": false,
//    "editors_choice_date": null,
//    "editored_by": null,
//    "feature": "popular",
//    "feature_date": "2020-10-05T21:20:02+00:00",
//    "fill_switch": {
//      "access_deleted": false,
//      "access_private": false,
//      "include_deleted": false,
//      "exclude_private": false,
//      "exclude_nude": false,
//      "always_exclude_nude": false,
//      "exclude_block": true,
//      "current_user_id": null,
//      "only_user_active": true,
//      "include_tags": false,
//      "include_geo": false,
//      "include_licensing": false,
//      "include_admin_locks": false,
//      "include_like_by": false,
//      "include_comments": false,
//      "include_user_info": false,
//      "include_follow_info": false,
//      "include_equipment_info": false
//    }
//  },
