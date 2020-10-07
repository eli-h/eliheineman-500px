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
    let user: User
}

struct Image: Decodable {
    let format: String
    let size: Int
    let url: String
    let https_url: String
}

struct User: Decodable {
    let id: Int
    let username: String
    let fullname: String
    let avatar_version: Int
    let registration_date: String
    let userpic_url: String
    let firstname: String
    let lastname: String?
    let about: String?
    let city: String?
    let state: String?
    let country: String
    let followers_count: Int
}
